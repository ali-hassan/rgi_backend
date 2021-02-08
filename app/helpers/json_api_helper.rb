# frozen_string_literal: true
module JsonApiHelper
	def self.format_date(date)
		if date.present?
			date.strftime("%B %d, %Y")
		else
			""
		end
	end
end
