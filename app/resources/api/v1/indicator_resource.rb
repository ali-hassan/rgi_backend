module Api
  module V1
    class IndicatorResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :average, :min, :max, :position
      has_many :questions
      has_one :subcategory
      has_many :country_sector_indicators
      filters :id, :name

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
