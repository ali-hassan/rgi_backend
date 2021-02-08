JSONAPI.configure do |config|
  # built in paginators are :none, :offset, :paged
  config.default_paginator = :paged
  config.default_page_size = 20
  config.maximum_page_size = 1000
  config.resource_cache = Rails.cache
end
#require_relative '../../lib/core_ext/json_api.rb'
