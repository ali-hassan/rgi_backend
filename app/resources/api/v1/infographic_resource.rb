module Api
  module V1
    class InfographicResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :pdf, :image, :thumbnail, :slug

      # These methods prevent from showing a link like /images/original/missing.png
      def pdf
      	@model.pdf if @model.pdf.present?
      end

      def image
      	@model.image if @model.image.present?
      end

      def thumbnail
      	@model.thumbnail.url(:thumb) if @model.thumbnail.present?
      end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
