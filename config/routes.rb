Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get '/admins' => 'homes#top'
  	get '/search'=>'search#search'
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
        get :current_index
        resource :order_details,only: [:update]
      end
      collection do
        get :today_order_index
      end
    end
  end


# 顧客用
devise_scope :customer do
    post '/customers/show' => 'public/customers#show'
  end
  
 scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :customers,     only: [:show, :edit, :update, :destroy]
    resources :articles,  only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource  :likes,     only: [:create, :destroy]
      resources :comments,  only: [:create, :destroy]
    end
    get 'articles/:id' => 'articles#show'
    get '/customer/unsubscribe' => 'customer#unsubscribe'
    get '/search' => 'searches#search'
  end

  namespace :admin do
    resources :customers,     only: [:index, :show, :edit, :update, :destroy]
    resources :articles,  only: [:index, :show, :edit, :update, :destroy]
    get '/search' => 'searches#search'
  end
  
  get 'maps/index'
  resources :maps, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end