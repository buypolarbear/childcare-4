class Document < ActiveRecord::Base
	attr_accessible :path
	belongs_to :user
	mount_uploader :path, DocsUploader
end
