Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do  
    resources :mati_imports do
      member do
        post :importdata
      end
    end  
    get 'mati_settings' => 'mati_settings#edit'
    patch 'mati_settings' => 'mati_settings#update'
  end
  
end
