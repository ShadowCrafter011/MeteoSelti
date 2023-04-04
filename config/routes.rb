Rails.application.routes.draw do
  root "measurement#list"

  defaults format: :json do
    put "api/create", to: "api#create"
    post "api/:id/attach_image", to: "api#attach_image"
  end

  get "measurements", to: "measurement#list", as: "measurements"
  get "measurement/:id", to: "measurement#show", as: "measurement"
end
