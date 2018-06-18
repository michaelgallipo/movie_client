Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do

    get "movies" => "movies#index"
    get "movies/new" => "movies#new"
    get "movies/:id" => "movies#show"
    post "movies" => "movies#create"
    get "movies/:id/edit" => "movies#edit"
    patch "movies/:id" => "movies#update"
    delete "movies/:id" => "movies#destroy"

  end

end
