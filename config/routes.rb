Rails.application.routes.draw do
  
  get 'base/index'
  get 'base/logout',:to=>'base#destroy',:as =>'logout'
  root 'base#index'
   get 'base/ckeditorView',:to =>'base#ckeditorView'
   post 'base/connectToMail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'auth/:provider/callback',:to => 'base#create',:via =>[:get,:post]
  mount Ckeditor::Engine => '/ckeditor'
end
