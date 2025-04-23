Rails.application.routes.draw do
  get '/up', to: proc { [200, {}, ['OK']] }  # Add this line

  root 'welcome#index'
end
