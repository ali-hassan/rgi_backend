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

class Contact < MediaCenterResource
end
