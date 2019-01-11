Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do

    root 'topics#index'

    devise_for :users
    #resources :users

    get 'users/index'
    get 'users/show/:id' => 'users#show', as: :users_show

    get 'topics/index'
    get 'topics/show/:id' => 'topics#show', as: :topics_show
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post 'topics/create' => 'topics#create'

    delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete

    #Writing Thread
    post 'posts/create' => 'post#create', as: :post_create

    #User Edit
    #get 'users/sign_in' => 'users#sign_in'
  #  get 'users/sign_up' => 'users#sign_up'

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
  end
end
