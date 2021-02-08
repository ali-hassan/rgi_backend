# == Schema Information
#
# Table name: abouts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#  subtitle   :string
#  slug       :string
#

class About < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  has_many :documents
  has_many :images

  validates_uniqueness_of :slug
  validate :null_slug

  accepts_nested_attributes_for :documents, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

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
