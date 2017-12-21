Rails.application.routes.draw do
  get 'chatspace' => 'messages#index'
end
