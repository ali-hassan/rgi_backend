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

class MediaCenterResource < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  validates_uniqueness_of :slug
  validate :null_slug

  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  has_attached_file :image, styles: {thumb: '300x300>'}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 700.kilobytes

  has_attached_file :thumbnail, styles: {thumb: '200x200>'}
  validates_attachment :thumbnail, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_with AttachmentSizeValidator, attributes: :thumbnail, less_than: 700.kilobytes
  
  def should_generate_new_friendly_id?
    if !slug?
      new_record?
    else
      false
    end
  end

  def null_slug
    if !new_record? && slug.blank?
      errors.add(:slug, 'Slug must not be empty.')
    end
  end
end
