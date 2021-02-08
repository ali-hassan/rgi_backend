module Api
  module V1
    class CountrySectorSubcategoryResource < JSONAPI::Resource
      immutable
      caching

      attributes :score, :rank
      has_many :country_sector_indicators
      has_one :subcategory, always_include_linkage_data: true
      has_one :country_sector
      filters :id, :rank

      def custom_links(_)
        { self: nil }
      end
    end
  end
end