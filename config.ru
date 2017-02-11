# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application.routes.draw do
  root 'messages#index'
  resources :messages , only: [:create]
end

