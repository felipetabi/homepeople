class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@booking = Booking.find(params[:booking_id])
		
		if current_user == @booking.client && @booking.comment.nil? #&& !(@booking.schedules.maximum(:start_date) < DateTime.now)
			@comment = @booking.build_comment
		else
			redirect_to root_path, alert: "No puedes comentar"
		end
	end

	def create
		booking = Booking.find(params[:booking_id])
    	@comment = current_user.comments.new(comment_params.merge(booking_id:booking.id))
   		if @comment.save
			redirect_to root_path, notice:"Hiciste un comentario"
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def set_comment
		@comment = Comment.find(params[:id]) 
	end

	def comment_params
		params.require(:comment).permit(:rating, :body)
	end
	
end
