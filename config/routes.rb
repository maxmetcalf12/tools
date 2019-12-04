Rails.application.routes.draw do
  devise_for :users
  root 'static#index'
  get 'budget', action: :index, controller: :budget
  get 'budget/month/:month', action: :index, controller: :budget, as: 'month_index'
  scope 'budget' do
    resources :transactions
    resources :budget_categories
    post 'monthly-transactions', controller: :transactions
    post 'monthly-sum', controller: :budget
  end
  resources :time_trackers do
    post 'clock_in'
    post 'clock_out'
  end
end
