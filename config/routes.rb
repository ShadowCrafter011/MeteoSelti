Rails.application.routes.draw do
  defaults format: :json do
    put "api/create", to: "api#create"
    post "api/:id/attach_image", to: "api#attach_image"
  end
end
