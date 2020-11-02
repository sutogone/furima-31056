Rails.application.routes.draw do
  root to: "items#index"  #トップページを設定
  resources :items        #itemsコントローラーのルーティング設定
end
