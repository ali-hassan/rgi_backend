module Api
  module V1
    class QuestionResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :number, :description, :position
      has_many :answers
      has_one :indicator
      filters :id, :name, :number

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
