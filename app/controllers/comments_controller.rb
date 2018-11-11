class CommentsController < ApplicationController
    def create
    @comment = Comment.create(text: comment_params[:text], pen_id: comment_params[:hanpen_id], user_id: current_user.id)
    redirect_to "/hanpen/#{@comment.pen.id}"
    end
    
    private
    def comment_params
    params.permit(:text, :hanpen_id)
    end
end
