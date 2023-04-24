class GraphController < ApplicationController
  before_action -> { setup_locale "graph" }

  def list
    @rows = (Measurement::MEASUREMENT_KEYS.length / 4.0).ceil
  end

  def show
    @key = params[:measurement].to_sym
    @name = Measurement::measurement_name @key
    @timeframes = {
      "Last hour": {
        measurements: Measurement::created_at_most(1.hour.ago),
        points: true
      },
      "Last day": {
        measurements: Measurement::created_at_most(24.hours.ago),
        points: false
      },
      "Since start": {
        measurements: Measurement.all,
        points: false
      }
    }
  end
end
