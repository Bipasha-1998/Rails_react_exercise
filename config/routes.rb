Rails.application.routes.draw do
  root to: "homepage#index"
  get "/*path" => "homepage#index"
end
