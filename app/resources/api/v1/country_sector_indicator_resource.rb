module Api
  module V1
    class CountrySectorIndicatorResource < JSONAPI::Resource
      immutable
      caching

      attributes :score, :rank
      has_many :country_sector_questions
      has_one :indicator, always_include_linkage_data: true
      has_one :country_sector
      filters :id, :rank

      def custom_links(_)
        { self: nil }
      end
    end
  end
end