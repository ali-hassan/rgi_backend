module Api
  module V1
    class CategoryResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :average, :max, :min, :position
      has_many :subcategories
      has_many :country_sector_categories
      filters :id, :name

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
