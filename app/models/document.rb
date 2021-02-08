# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  title                 :string
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  about_id              :integer
#

class Document < ApplicationRecord
	belongs_to :about

	has_attached_file :document
	do_not_validate_attachment_file_type :document
end
