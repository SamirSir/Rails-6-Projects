class ApplicationController < ActionController::Base
	
	def after_sign_in_path_for(resource)
		root_path(current_user)
	end

	def favourite_text
		return @favourite_exists ? "Unfavourite" : "Favourite"
	end
	
	helper_method :favourite_text
end
 