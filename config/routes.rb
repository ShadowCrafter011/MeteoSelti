Rails.application.routes.draw do
  root "home#index"

    defaults format: :json do
      namespace :api do
        scope :upload do
          put "measurement", to: "measurement#create"
          post "image", to: "measurement#image"
        end

        get "ping", to: "api#ping"
      end
    end

  get "measurements", to: "measurement#list", as: "measurements"
  get "measurement/:id", to: "measurement#show", as: "measurement"

  get "graphs", to: "graph#list", as: "graphs"
  get "graph/:measurement", to: "graph#show", as: "graph"
end
