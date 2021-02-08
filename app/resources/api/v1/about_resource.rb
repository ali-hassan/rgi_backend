module Api
  module V1
    class AboutResource < JSONAPI::Resource
      immutable
      caching

      attributes :title, :subtitle, :slug, :position, :text
      has_many :images
      has_many :documents

      def self.default_sort
  			[{field: 'position', direction: :desc}]
      end

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
