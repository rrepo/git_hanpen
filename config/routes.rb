Rails.application.routes.draw do
  devise_for :users
  root    'hanpen#index'
  get     'hanpen'          =>'hanpen#index'
  get     'hanpen/whatis'   =>'hanpen#whatis'
  get     'hanpen/speak'    =>'hanpen#speak'
  get     'hanpen/new'      =>'hanpen#new'
  post    'hanpen/speak'    =>'hanpen#create'
  patch   'hanpen/:id'      =>'hanpen#update'
  get     'hanpen/:id/edit' =>'hanpen#edit'
  delete  'hanpen/:id'      =>'hanpen#destroy'
  get     'users/:id'       =>'users#show'
  get     'hanpen/show'     =>'hanpen#show'
  resources :hanpen
  resources :hanpen do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end

# phpアドミン起動
# sudo service httpd start
# mysql起動
# sudo service mysqld start
# テストサーバー起動
# rails s -p $PORT -b $IP
# clr+cでサーバーシャットダウン