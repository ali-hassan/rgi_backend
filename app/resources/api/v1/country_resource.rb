module Api
  module V1
    class CountryResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :iso, :description
      has_many :country_sectors
      has_many :groups
      filters :id, :name, :iso

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
