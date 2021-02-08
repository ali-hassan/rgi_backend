module Api
  module V1
    class ContactResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :description, :slug

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
