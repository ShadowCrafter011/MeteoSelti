Rails.application.routes.draw do
  root "home#index"

  defaults format: :json do
    put "api/create", to: "api#create"
    post "api/:id/attach_image", to: "api#attach_image"

    get "api/ping", to: "api#ping"
  end

  get "measurements", to: "measurement#list", as: "measurements"
  get "measurement/:id", to: "measurement#show", as: "measurement"

  get "graphs", to: "graph#list", as: "graphs"
  get "graph/:measurement", to: "graph#show", as: "graph"
end
