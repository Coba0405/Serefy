class Public::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
    @tags = Tag.all
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
  if params[:tag_id].present?
    @posts = Tag.find(params[:tag_id]).posts
  elsif params[:genre_id].present?
    @posts = Genre.find(params[:genre_id]).posts
  else
    @posts = Post.all
  end
end

  # def index
  #   @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  #   @posts = params[:genre_id].present? ? Genre.find(params[:genre_id]).posts : Post.all
  # end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  # 投稿データのストロングパラメーター
  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :genre_id, tag_ids: [])
  end
end
