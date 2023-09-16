class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @genres = Genre.all
    @tags = Tag.all
    @posts = Post.search("title", params[:word]).or(Post.search("body", params[:word]))
  end
end
