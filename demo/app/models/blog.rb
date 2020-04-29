class Blog < ApplicationRecord
	
	attr_accessor :remove_image 

	after_save :purge_image, if: :remove_image
	private def purge_image
		image.purge_later
	end
	


	has_many_attached :pictures
	has_one_attached :image	
	has_one_attached :note

	#builtin validation;
	validates :title, presence: true
	validates :caption, presence: true
	
	#custom validation for attached image
	validate :correct_image_type
	validate :correct_file_type

	#is used when the imageMagick is installed
	def thumbnail
		return self.image.variant(resize: '300x300')
	end

	def banner 
		return self.image.variant(resize: '1200x300!')
	end


	private

	def correct_image_type
		if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
			errors.add(:image, " should have .jpg, .jpeg or .png extension" )
		elsif !image.attached? 
			errors.add(:image, 'required')
		end 
	end


	def correct_file_type
		if !note.attached? 
			errors.add(:note, 'required')
		end 
	end


end
  