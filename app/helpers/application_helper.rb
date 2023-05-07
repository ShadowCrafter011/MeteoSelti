module ApplicationHelper
    def convert_time time
        time.in_time_zone(session["time_zone"] || "Europe/Zurich")
    end
end
