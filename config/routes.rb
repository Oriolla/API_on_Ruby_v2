Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace 'api' do
     namespace "v1" do
      resources :jobs
      resources :companies do
        resources :jobs
      end
      resources :geeks
      resources :applies
    end
   end

   match "*path", to: "application#catch_404", via: :all


end
