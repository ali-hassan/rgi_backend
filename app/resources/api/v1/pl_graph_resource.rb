module Api
  module V1
    class PlGraphResource < JSONAPI::Resource
      immutable
      caching

      attributes :practice, :law, :gap

      has_one :country_sector, foreign_key_on: :related

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
