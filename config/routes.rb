Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"  #トップページを設定
  resources :items do        #itemsコントローラーのルーティング設定
    resources :purchases      #itemのidに関連してitemを購入できるようにルーティングのネスト化
  end
end
