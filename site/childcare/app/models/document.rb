class Document < ActiveRecord::Base
	# can't use attr_accessible anymore (it's a Rails 3.x thing);
	# we have to use strong parameter methods in the controller
	# attr_accessible :path
	
	belongs_to :user
	mount_uploader :path, DocsUploader
end
