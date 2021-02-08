module Api
  module V1
    class SpecialInstitutionResource < JSONAPI::Resource
      immutable
      caching

      attributes :institution_type, :title, :description, :name, :percentage,
                 :revenue_value, :revenue_unit, :score, :rank_1, :rank_2

      def custom_links(_)
        { self: nil }
      end
    end
  end
end
