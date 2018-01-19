Rails.application.routes.draw do
  resources :pages do
    resources :localizations
  end
  get 'demo/edit' => 'demo#edit', as: :demo_edit
  get 'demo/show' => 'demo#show', as: :demo_show
  get 'demo/localize' => 'demo#localize', as: :demo_localize
  get 'demo/show-localized' => 'demo#show_localized', as: :demo_show_localized
  get 'demo/data' => 'demo#data', as: :demo_data
  root to: 'demo#index'
end
