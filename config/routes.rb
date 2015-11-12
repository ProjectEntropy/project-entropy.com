Rails.application.routes.draw do
  get "crowdfund", controller: "crowdfund", action: "index"

  root to: 'visitors#index'  
end
