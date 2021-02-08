module Api
  module V1
    class DirectionScoreResource < JSONAPI::Resource
      immutable
      caching

      attributes :issue, :score, :direction

      has_one :direction_graph

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
