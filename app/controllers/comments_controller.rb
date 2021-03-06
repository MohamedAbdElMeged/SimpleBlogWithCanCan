class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @post=Post.find(params[:post_id])
    @comment =@post.comments.new(comment_params)
    @comment.author_id = current_user.id
    @comment.save

    redirect_to post_path(@post)
      
  end
  private def comment_params
    params.require(:comment).permit(:username,:body)
    end

  
end
