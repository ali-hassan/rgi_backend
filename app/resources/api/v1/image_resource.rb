module Api
  module V1
    class ImageResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :image

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
