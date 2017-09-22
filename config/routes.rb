Rails.application.routes.draw do

  root   'questions#index'

  get    'signup', to: 'users#new'
  post   'signup', to: 'users#create'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  get    'logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy'

  resources :questions do

    resources :answers, except: [:index, :show, :new] do
      resources :comments, module: :answers, except: [:index, :show]
    end

    resources :comments, module: :questions, except: [:index, :show]
  end

end
