class Dppost < ApplicationRecord
=begin
/***************************************************************************************
*    Title: Active Storage For Multiple Images | Validate & Resize | Ruby on Rails 5.2 source code
*    Author: Deanin
*    Date: June 3 2018
*    Code version: Unknown
*    Availability: https://www.youtube.com/watch?v=A23zCePXe74&t=649s
* 
***************************************************************************************/
=end
	# dependent: controls what happens to associated objects 
	# when images/file is destroyed, rails executes callbacks
	# :destroy destroys images/file
	# has_many_attached --> allows multiple images
	has_many_attached :images, dependent: :destroy
	# has_one_attached --> only necessary for one file to be
	# attached
	has_one_attached :file, dependent: :destroy
	# validates makes sure that the title and body is there
	# or else the post cannot be created and an error
	# message will show
	validates :title, presence: true
	validates :body, presence: true
	# validate means that the following type of attachments
	# can be further defined in a custom method
	validate :image_type
	validate :file_type

	private
	def image_type
		# if there are no attached images, an error message
		# will show up with the message below
		if images.attached? == false
			errors.add(:images, "are missing")
		end
		images.each do |image|
			# if image is not in the file type it is listed below
			# an error message will show up
			if !image.content_type.in?(%('image/jpeg image/png'))
				errors.add(:images, 'needs to be a JPEG or PNG')
			end
	end

	def file_type
		# if there is no attached file, an error message
		# will show up with the message below
		if file.attached? == false
			errors.add(:file, "is missing")
		end
	end
end
end
