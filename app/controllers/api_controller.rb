
class ApiController < ApplicationController

  include JSONAPI::ActsAsResourceController
  #skip_before_action :protect_from_forgery
  protect_from_forgery with: :null_session
end
