module Api
  module V1
    class AnswerResource < JSONAPI::Resource
      immutable
      caching

      attributes :name, :answer_type, :value_number, :value_string
      has_one :question
      filters :id, :name

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
