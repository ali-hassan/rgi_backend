module Api
  module V1
    class BubbleGraphResource < JSONAPI::Resource
      immutable
      caching

      attributes :x, :y, :size, :color

      has_one :country_sector, foreign_key_on: :related

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
