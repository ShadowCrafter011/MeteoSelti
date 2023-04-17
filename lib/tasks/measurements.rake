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

  task destroy: :environment do
    Measurement.all.each do |m|
      m.destroy
    end
  end

end
