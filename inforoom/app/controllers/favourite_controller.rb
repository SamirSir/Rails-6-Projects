class FavouriteController < ApplicationController
  def update
  	favourite = Favourite.where(content: Content.find(params[:content]), user: current_user)
  	if favourite == []
  		#create favourite
  		Favourite.create(content: Content.find(params[:content]), user: current_user)
		  @favourite_exists = true	
  	else
  		# delete the favourite
  		favourite.destroy_all
  		@favourite_exists = false 
  	end
    respond_to  do |format|
      format.html {}
  	 	format.js {}
  	end
   end
end
