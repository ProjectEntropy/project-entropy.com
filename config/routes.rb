Rails.application.routes.draw do
  get "crowdfund", controller: "crowdfund", action: "index"
  get 'crowdfund_data/:metric', to: 'crowdfund_data#show'
  
  root to: 'visitors#index'  
end
