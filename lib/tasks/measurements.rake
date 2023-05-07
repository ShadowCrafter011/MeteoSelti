namespace :measurements do
  desc "Populate database with measurements from the production environment"
  task populate: :environment do
    response = HTTParty.get(
      "https://api.meteoselti.ch/api/measurements",
      headers: {
        Authorization: ENV["BEARER_TOKEN"]
      }
    )
    
    if response.code != 200
      raise "Failed to fetch data"
    end

    measurements = JSON.parse(response.body)
    Measurement.create measurements
  end

  desc "Find duplicates for time measured_at"
  task duplicates: :environment do
    duplicates = find_duplicates

    puts "Measured at duplicates:"
    duplicates.each do |time, ids|
      puts "  #{time}:  #{ids}"
    end
  end

  desc "Destroy measured_at duplicates. Favorising measurements with images for keeping"
  task "duplicates:destroy": :environment do
    duplicates = find_duplicates

    duplicates.each do |_, ids|
      keep = Measurement.find(ids.first)
      puts keep.id

      ids.each do |id|
        if (measurement = Measurement.find(id)).sky_capture.attached?
          keep = measurement
        end
      end
      puts keep.id

      ids.each do |id|
        next if keep.id == id
        puts "destroy #{id}"

        Measurement.find(id).destroy
      end 
    end
  end

  desc "Destroy all measurements. DO NOT USE IN PRODUCTION!"
  task destroy: :environment do
    raise "Action not allowed in production" if Rails.env == "production"

    Measurement.all.each do |m|
      m.destroy
    end
  end

  private
  def find_duplicates
    duplicates = {}

    Measurement.all.each do |m|
      if (dupes = Measurement.where("measured_at = ?", m.measured_at)).length > 1
        duplicates[m.measured_at] = []
        dupes.each do |d|
          duplicates[m.measured_at].append d.id
        end
      end
    end

    return duplicates
  end

end
