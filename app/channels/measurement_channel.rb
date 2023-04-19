class MeasurementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "measurement"
  end
end
