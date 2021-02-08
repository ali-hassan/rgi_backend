module Api
  module V1
    class PressReleaseResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :date, :pdf, :slug

      def date
      	JsonApiHelper.format_date(@model.post_date)
      end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
