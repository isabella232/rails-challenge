class CommentsController < ApplicationController
  def create
  	@picture = Picture.get(params[:comment][:picture_id])
  	@picture.comments << Comment.new(params[:comment])
  	if @picture.comments.save
  		respond_to do |format|
  			format.html {redirect_to @picture}
  			format.js
  		end
  	else
  		redirect_to @picture
  	end
  end

  # def destroy
  # 	#@comment = current_picture.comments.
  # 	@comment.destroy
  # 	redirect_to root_path
  # end
end
