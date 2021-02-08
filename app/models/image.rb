# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string
#  about_id           :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Image < ApplicationRecord
	belongs_to :about

	has_attached_file :image, styles: {thumb: '300x300>'}
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]}
	validates_with AttachmentSizeValidator, attributes: :image, less_than: 700.kilobytes
end
