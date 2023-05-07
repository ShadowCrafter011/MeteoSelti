Rails.application.routes.draw do
  root "home#index"

  defaults format: :json do
    namespace :api do
      scope :upload do
        put "measurement", to: "measurement#create"
        post "image", to: "measurement#image"
      end

      scope :measurement do
        scope :last do
          get "at", to: "measurement#last_measured_at"
        end
      end

      scope :measurements do
        get "/", to: "measurement#all"

        scope :last do
          get ":amount", to: "measurement#last"
        end
      end

      get "ping", to: "api#ping"
    end
  end

  namespace :frames do
    get "measurements/:frame_id", to: "measurement#list"
  end

  get "measurements", to: "measurement#list", as: "measurements"
  get "measurement/:id", to: "measurement#show", as: "measurement"

  get "graphs", to: "graph#list", as: "graphs"
  get "graph/:measurement", to: "graph#show", as: "graph"

  get "language/:locale", to: "language#change", as: "language_change"
  get "timezone", to: "home#time_zone"
end
