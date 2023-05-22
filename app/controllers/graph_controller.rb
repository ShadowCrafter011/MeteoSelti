class GraphController < ApplicationController
  before_action -> { setup_locale "graph" }

  def list
    @rows = (Measurement::GRAPH_MEASUREMENT_KEYS.length / 4.0).ceil
  end

  def show
    @key = params[:measurement].to_sym

    redirect_to graphs_path unless Measurement::GRAPH_MEASUREMENT_KEYS.include? @key

    @name = Measurement::measurement_name @key
    @timeframes = {
      tp("last_hour") => {
        measurements: Measurement::created_at_most(1.hour.ago),
        points: true
      },
      tp("last_day") => {
        measurements: Measurement::created_at_most(24.hours.ago),
        points: false
      },
      tp("since_start") => {
        measurements: Measurement.all,
        points: false
      }
    }
  end
end
