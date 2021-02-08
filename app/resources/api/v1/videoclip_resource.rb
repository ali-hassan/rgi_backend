module Api
  module V1
    class VideoclipResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :description, :link, :thumbnail, :slug
      attribute :date

      def thumbnail
      	@model.thumbnail.url(:thumb)
      end

      def date
      	JsonApiHelper.format_date(@model.post_date)
      end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
