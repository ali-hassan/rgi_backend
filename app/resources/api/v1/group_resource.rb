module Api
  module V1
    class GroupResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :description
      has_many :countries
      filters :id, :name

      def custom_links(_)
        { self: nil }
      end
    end
  end
end