class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = post.id
    comment.save
    redirect_to public_post_path(post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if admin_signed_in?
      @comment.destroy
    else
      if @comment.user_id == current_user.id
        @comment.destroy
      end
    end
    # @comment = Comment.find(params[:id])
    # @user = current_user
    # if @user.update(comment_content)
    #   redirect_to public_post_show(@post.id)
    # else
    #   render :show
    # end
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end
