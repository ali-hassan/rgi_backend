module Api
  module V1
    class CompositeResource < JSONAPI::Resource
      immutable
      caching

      attributes :average, :max, :min

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
