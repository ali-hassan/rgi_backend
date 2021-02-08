module Api
  module V1
    class SubcategoryResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :average, :min, :max, :position
      has_many :indicators
      has_one :category
      has_many :country_sector_subcategories
      filters :id, :name

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
