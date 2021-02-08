module Api
  module V1
    class MediaCoverageResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :link, :slug
      attribute :date

      def date
      	JsonApiHelper.format_date(@model.post_date)
      end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
