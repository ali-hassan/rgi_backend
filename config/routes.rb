# frozen_string_literal: true
# == Route Map
#
#                          Prefix Verb   URI Pattern                                      Controller#Action
#        country_sector_questions GET    /country_sector_questions(.:format)              country_sector_questions#index
#                                 POST   /country_sector_questions(.:format)              country_sector_questions#create
#     new_country_sector_question GET    /country_sector_questions/new(.:format)          country_sector_questions#new
#    edit_country_sector_question GET    /country_sector_questions/:id/edit(.:format)     country_sector_questions#edit
#         country_sector_question GET    /country_sector_questions/:id(.:format)          country_sector_questions#show
#                                 PATCH  /country_sector_questions/:id(.:format)          country_sector_questions#update
#                                 PUT    /country_sector_questions/:id(.:format)          country_sector_questions#update
#                                 DELETE /country_sector_questions/:id(.:format)          country_sector_questions#destroy
#    country_sector_subcategories GET    /country_sector_subcategories(.:format)          country_sector_subcategories#index
#                                 POST   /country_sector_subcategories(.:format)          country_sector_subcategories#create
#  new_country_sector_subcategory GET    /country_sector_subcategories/new(.:format)      country_sector_subcategories#new
# edit_country_sector_subcategory GET    /country_sector_subcategories/:id/edit(.:format) country_sector_subcategories#edit
#      country_sector_subcategory GET    /country_sector_subcategories/:id(.:format)      country_sector_subcategories#show
#                                 PATCH  /country_sector_subcategories/:id(.:format)      country_sector_subcategories#update
#                                 PUT    /country_sector_subcategories/:id(.:format)      country_sector_subcategories#update
#                                 DELETE /country_sector_subcategories/:id(.:format)      country_sector_subcategories#destroy
#       country_sector_categories GET    /country_sector_categories(.:format)             country_sector_categories#index
#                                 POST   /country_sector_categories(.:format)             country_sector_categories#create
#     new_country_sector_category GET    /country_sector_categories/new(.:format)         country_sector_categories#new
#    edit_country_sector_category GET    /country_sector_categories/:id/edit(.:format)    country_sector_categories#edit
#         country_sector_category GET    /country_sector_categories/:id(.:format)         country_sector_categories#show
#                                 PATCH  /country_sector_categories/:id(.:format)         country_sector_categories#update
#                                 PUT    /country_sector_categories/:id(.:format)         country_sector_categories#update
#                                 DELETE /country_sector_categories/:id(.:format)         country_sector_categories#destroy
#                       questions GET    /questions(.:format)                             questions#index
#                                 POST   /questions(.:format)                             questions#create
#                    new_question GET    /questions/new(.:format)                         questions#new
#                   edit_question GET    /questions/:id/edit(.:format)                    questions#edit
#                        question GET    /questions/:id(.:format)                         questions#show
#                                 PATCH  /questions/:id(.:format)                         questions#update
#                                 PUT    /questions/:id(.:format)                         questions#update
#                                 DELETE /questions/:id(.:format)                         questions#destroy
#                   subcategories GET    /subcategories(.:format)                         subcategories#index
#                                 POST   /subcategories(.:format)                         subcategories#create
#                 new_subcategory GET    /subcategories/new(.:format)                     subcategories#new
#                edit_subcategory GET    /subcategories/:id/edit(.:format)                subcategories#edit
#                     subcategory GET    /subcategories/:id(.:format)                     subcategories#show
#                                 PATCH  /subcategories/:id(.:format)                     subcategories#update
#                                 PUT    /subcategories/:id(.:format)                     subcategories#update
#                                 DELETE /subcategories/:id(.:format)                     subcategories#destroy
#                      categories GET    /categories(.:format)                            categories#index
#                                 POST   /categories(.:format)                            categories#create
#                    new_category GET    /categories/new(.:format)                        categories#new
#                   edit_category GET    /categories/:id/edit(.:format)                   categories#edit
#                        category GET    /categories/:id(.:format)                        categories#show
#                                 PATCH  /categories/:id(.:format)                        categories#update
#                                 PUT    /categories/:id(.:format)                        categories#update
#                                 DELETE /categories/:id(.:format)                        categories#destroy
#                 country_sectors GET    /country_sectors(.:format)                       country_sectors#index
#                                 POST   /country_sectors(.:format)                       country_sectors#create
#              new_country_sector GET    /country_sectors/new(.:format)                   country_sectors#new
#             edit_country_sector GET    /country_sectors/:id/edit(.:format)              country_sectors#edit
#                  country_sector GET    /country_sectors/:id(.:format)                   country_sectors#show
#                                 PATCH  /country_sectors/:id(.:format)                   country_sectors#update
#                                 PUT    /country_sectors/:id(.:format)                   country_sectors#update
#                                 DELETE /country_sectors/:id(.:format)                   country_sectors#destroy
#                         sectors GET    /sectors(.:format)                               sectors#index
#                                 POST   /sectors(.:format)                               sectors#create
#                      new_sector GET    /sectors/new(.:format)                           sectors#new
#                     edit_sector GET    /sectors/:id/edit(.:format)                      sectors#edit
#                          sector GET    /sectors/:id(.:format)                           sectors#show
#                                 PATCH  /sectors/:id(.:format)                           sectors#update
#                                 PUT    /sectors/:id(.:format)                           sectors#update
#                                 DELETE /sectors/:id(.:format)                           sectors#destroy
#                       countries GET    /countries(.:format)                             countries#index
#                                 POST   /countries(.:format)                             countries#create
#                     new_country GET    /countries/new(.:format)                         countries#new
#                    edit_country GET    /countries/:id/edit(.:format)                    countries#edit
#                         country GET    /countries/:id(.:format)                         countries#show
#                                 PATCH  /countries/:id(.:format)                         countries#update
#                                 PUT    /countries/:id(.:format)                         countries#update
#                                 DELETE /countries/:id(.:format)                         countries#destroy
#                          groups GET    /groups(.:format)                                groups#index
#                                 POST   /groups(.:format)                                groups#create
#                       new_group GET    /groups/new(.:format)                            groups#new
#                      edit_group GET    /groups/:id/edit(.:format)                       groups#edit
#                           group GET    /groups/:id(.:format)                            groups#show
#                                 PATCH  /groups/:id(.:format)                            groups#update
#                                 PUT    /groups/:id(.:format)                            groups#update
#                                 DELETE /groups/:id(.:format)                            groups#destroy
#

require 'api_constraints'

Rails.application.routes.draw do

  constraints subdomain: 'admin' do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
    mount Ckeditor::Engine => '/ckeditor'
  end

  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' }, path: '/' do

    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do

      jsonapi_resources :groups do
      end
      jsonapi_resources :countries do
      end
      jsonapi_resources :sectors do
      end
      jsonapi_resources :country_sectors do
      end

      jsonapi_resources :categories do
      end
      jsonapi_resources :subcategories do
      end
      jsonapi_resources :indicators do
      end
      jsonapi_resources :questions do
      end
      jsonapi_resources :answers do
      end


      jsonapi_resources :country_sector_categories do
      end
      jsonapi_resources :country_sector_subcategories do
      end
      jsonapi_resources :country_sector_indicators do
      end
      jsonapi_resources :country_sector_questions do
      end

      jsonapi_resources :pl_graphs do
      end
      jsonapi_resources :bubble_graphs do
      end
      jsonapi_resources :direction_graphs do
      end
      jsonapi_resources :composites do
      end

      jsonapi_resources :abouts do
      end
      jsonapi_resources :home_informations do
      end

      jsonapi_resources :press_releases do
      end
      jsonapi_resources :infographics do
      end
      jsonapi_resources :videoclips do
      end
      jsonapi_resources :media_coverages do
      end
      jsonapi_resources :photo_galleries do
      end
      jsonapi_resources :contacts do
      end
    end
  end
  get '/health' => 'health#health'
end
