module Api
  module V1
    class DirectionGraphResource < JSONAPI::Resource
      immutable
      caching

      has_one :country_sector, foreign_key_on: :related
      has_many :direction_scores, foreign_key_on: :related

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
