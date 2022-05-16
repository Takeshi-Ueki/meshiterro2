class PostCommentsController < ApplicationController
  def create
    comment = PostComment.new(comment_params)
    post_image = PostImage.find(params[:post_image_id])
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image.id)
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to post_image_path(params[:post_image_id])
  end
  
  private
  
  def comment_params
    params.require(:post_comment).permit(:comment)
  end

end