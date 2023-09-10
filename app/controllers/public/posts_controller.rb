class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # ↑この投稿の「user_id」として「current_user.id」の値を代入する
    @post.save
    redirect_to public_post_path(params:id)
  end
  
  # 投稿データのストロングパラメーター
  private
  def post_params
    params.require(:post).permit(:image, :title, :body)
  end
end
