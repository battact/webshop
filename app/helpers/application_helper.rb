module ApplicationHelper
	def placeholder_image width, height, class_names = :thumbnail
		image_tag "http://placehold.it/#{width}x#{height}", class: class_names
	end
end
