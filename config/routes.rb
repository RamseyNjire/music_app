# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#               new_session GET    /session/new(.:format)                                                                   sessions#new
#              edit_session GET    /session/edit(.:format)                                                                  sessions#edit
#                   session GET    /session(.:format)                                                                       sessions#show
#                           PATCH  /session(.:format)                                                                       sessions#update
#                           PUT    /session(.:format)                                                                       sessions#update
#                           DELETE /session(.:format)                                                                       sessions#destroy
#                           POST   /session(.:format)                                                                       sessions#create
#               band_albums GET    /bands/:band_id/albums(.:format)                                                         albums#index
#            new_band_album GET    /bands/:band_id/albums/new(.:format)                                                     albums#new
#                     bands GET    /bands(.:format)                                                                         bands#index
#                           POST   /bands(.:format)                                                                         bands#create
#                  new_band GET    /bands/new(.:format)                                                                     bands#new
#                 edit_band GET    /bands/:id/edit(.:format)                                                                bands#edit
#                      band GET    /bands/:id(.:format)                                                                     bands#show
#                           PATCH  /bands/:id(.:format)                                                                     bands#update
#                           PUT    /bands/:id(.:format)                                                                     bands#update
#                           DELETE /bands/:id(.:format)                                                                     bands#destroy
#              album_tracks GET    /albums/:album_id/tracks(.:format)                                                       tracks#index
#           new_album_track GET    /albums/:album_id/tracks/new(.:format)                                                   tracks#new
#                    albums POST   /albums(.:format)                                                                        albums#create
#                edit_album GET    /albums/:id/edit(.:format)                                                               albums#edit
#                     album GET    /albums/:id(.:format)                                                                    albums#show
#                           PATCH  /albums/:id(.:format)                                                                    albums#update
#                           PUT    /albums/:id(.:format)                                                                    albums#update
#                           DELETE /albums/:id(.:format)                                                                    albums#destroy
#                    tracks POST   /tracks(.:format)                                                                        tracks#create
#                edit_track GET    /tracks/:id/edit(.:format)                                                               tracks#edit
#                     track GET    /tracks/:id(.:format)                                                                    tracks#show
#                           PATCH  /tracks/:id(.:format)                                                                    tracks#update
#                           PUT    /tracks/:id(.:format)                                                                    tracks#update
#                           DELETE /tracks/:id(.:format)                                                                    tracks#destroy
#                     notes POST   /notes(.:format)                                                                         notes#create
#                      note DELETE /notes/:id(.:format)                                                                     notes#destroy
#                      root GET    /                                                                                        users#new
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session

  resources :bands do
    resources :albums , only: [:new, :index]
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new, :index]
  end

  resources :tracks, except: [:new, :index]

  resources :notes, only: [:create, :destroy]


  root to: "users#new"
end
