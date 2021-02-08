module Api
  module V1
    class HomeInformationResource < JSONAPI::Resource
      immutable
      caching

      attributes :section, :title, :subtitle, :text, :link_text, :link_url

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
