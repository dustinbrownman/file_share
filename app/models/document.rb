class Document < ActiveRecord::Base
	belongs_to :upload

	has_attached_file :attachment
	validates :attachment, presence: true
end
