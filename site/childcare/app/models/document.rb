class Document < ActiveRecord::Base
	# can't use attr_accessible anymore (it's a Rails 3.x thing);
	# we have to use strong parameter methods in the controller
	# attr_accessible :path
	
	belongs_to :user
	mount_uploader :path, DocsUploader	
	
	before_save :update_document_attributes
  
	def size_kb
		if self.file_size?
			self.file_size/1024
		end
	end
	
  
	private
  
	def update_document_attributes
		if path.present? && path_changed?
			#self.content_type = self.path.content_type
			self.file_size = self.path.size
		end
	end
end
