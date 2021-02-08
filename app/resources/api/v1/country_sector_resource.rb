module Api
  module V1
    class CountrySectorResource < JSONAPI::Resource
      immutable
      caching

      attributes :description, :score, :rank, :performance_title, :performance_highlights_top,
                 :comparison_title, :comparison_description, :graph_type, :performance_highlights_bottom,
                 :graph_text, :footnote
      has_one :country
      has_one :sector
      has_many :country_sector_categories
      has_many :country_sector_subcategories
      has_many :country_sector_indicators
      has_many :country_sector_questions
      has_many :special_institutions
      has_one :pl_graph
      has_one :bubble_graph
      has_one :direction_graph

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
