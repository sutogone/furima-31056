Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"  #トップページを設定
  resources :items        #itemsコントローラーのルーティング設定
end
