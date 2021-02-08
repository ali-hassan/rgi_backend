# == Schema Information
#
# Table name: media_center_resources
#
#  id                     :integer          not null, primary key
#  type                   :string
#  link                   :string
#  title                  :string
#  description            :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_file_name        :string
#  image_content_type     :string
#  image_file_size        :integer
#  image_updated_at       :datetime
#  pdf_file_name          :string
#  pdf_content_type       :string
#  pdf_file_size          :integer
#  pdf_updated_at         :datetime
#  position               :integer
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  post_date              :date
#  slug                   :string
#

class Infographic < MediaCenterResource
	attr_accessor :delete_pdf, :delete_image
	before_save :check_delete_pdf, :check_delete_image
	
	private

	def check_delete_pdf
		self.pdf.clear if delete_pdf == '1'
	end

	def check_delete_image
		self.image.clear if delete_image == '1'
	end
end
