module Api
  module V1
    class PhotoGalleryResource < JSONAPI::Resource
      immutable
      caching

      attributes :image, :thumbnail, :date, :slug, :title
      attributes :position

      def thumbnail
      	@model.thumbnail.url(:thumb)
      end

      def date
      	JsonApiHelper.format_date(@model.post_date)
      end

      def self.default_sort
  			[{field: 'position', direction: :desc}]
			end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
