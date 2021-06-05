class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
    
    @comment = current_user.build_comments.new(comment_params)
		if @comment.save
			#redirect_to
		else
			#render :index, status: :unprocessable_entity
		end
	end

	def new
		@booking = Booking.find(params[:booking_id])
		@comment = Comment.new
	end

	private

	#def set_comment
	#	@comment = Comment.find(params[:id])
	#end

	def comment_params
		params.require(:comment).permit(:rating, :body)
	end
	
end
