class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    # @post.user = current_user
    @post.user_id = current_user.id
    # ↑この投稿の「user_id」として「current_user.id」の値を代入する
    # binding.pry
    @post.save
    
    redirect_to public_post_path(@post)
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  # 投稿データのストロングパラメーター
  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :genre_id)
  end
end
