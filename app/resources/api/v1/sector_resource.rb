module Api
  module V1
    class SectorResource < JSONAPI::Resource
      immutable
      caching

      attributes :name
      has_many :country_sectors

      def custom_links(_)
        { self: nil }
      end
    end
  end
end

