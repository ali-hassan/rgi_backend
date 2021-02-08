module Api
  module V1
    class DocumentResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :document

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
