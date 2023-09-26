class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    if params[:genre_id].present?
      @genres = Genre.find(params[:genre_id]).posts.order(created_at: :desc).page(params[:page])
    elsif params[:tag_id].present?
      @tags = Tag.find(params[:tag_id]).posts.order(created_at: :desc).page(params[:page])
    else
      @posts = Post.search("title", params[:word]).or(Post.search("body", params[:word])).page(params[:page])
    end
  end
end
