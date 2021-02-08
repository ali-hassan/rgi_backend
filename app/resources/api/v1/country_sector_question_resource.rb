module Api
  module V1
    class CountrySectorQuestionResource < JSONAPI::Resource
      immutable
      caching

      attributes :score, :rank, :status, :researcher_justification, :researcher_score,
                 :reviewer_justification, :reviewer_score, :final_score_justification, :final_score
      has_one :question, always_include_linkage_data: true
      filters :id, :rank

      def custom_links(_)
        { self: nil }
      end
    end
  end
end