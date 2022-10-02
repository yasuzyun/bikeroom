Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 顧客用
  get 'about' => 'public/homes#about'
  root 'public/homes#top'
  get '/customers/contact' => 'public/customers#contact'

  scope module: :public do
    resources :articles,only: [:new,:index,:show,:edit]
    get 'search' => 'articles#search'
    # deviseと衝突してしまうので、オリジナルに変更
    get 'edit/customers' => 'customers#edit'
    patch 'update/customers' => 'customers#update'
    
  	resource :customers,only: [:edit,:update,:show] do
  		collection do
  	     get 'quit'
  	     patch 'out'
  	  end
  	 end
  	end
  	  


# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
