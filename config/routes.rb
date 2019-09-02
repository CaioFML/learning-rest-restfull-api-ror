Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds

  # api_version(:module => "V1", :header => {:name => "X-Version", :value => "1.0"}) do
  constraints subdomain: 'v1' do
    scope module: 'v1' do
      resources :contacts do
        resource :kind, only: %i[show]
        resource :kind, only: %i[show], path: 'relationships/kind'

        resource :phones, only: %i[show]
        resource :phones, only: %i[show], path: 'relationships/phones'

        resource :phone, only: %i[update create destroy]
        resource :phone, only: %i[update create destroy], path: 'relationships/phones'

        resource :address, only: %i[show update create destroy]
        resource :address, only: %i[show update create destroy], path: 'relationships/address'
      end
    end
  end

  # api_version(:module => "V2", :header => {:name => "Accept", :value => "application/vnd.api+json; version=2"}) do
  constraints subdomain: 'v2' do
    scope module: 'v2' do
      resources :contacts do
        resource :kind, only: %i[show]
        resource :kind, only: %i[show], path: 'relationships/kind'

        resource :phones, only: %i[show]
        resource :phones, only: %i[show], path: 'relationships/phones'

        resource :phone, only: %i[update create destroy]
        resource :phone, only: %i[update create destroy], path: 'relationships/phones'

        resource :address, only: %i[show update create destroy]
        resource :address, only: %i[show update create destroy], path: 'relationships/address'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
