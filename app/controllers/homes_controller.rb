class HomesController < ApplicationController
  def top
    @genres = Genre.page(params[:page])
    @posts = Post.page(params[:page])
    @tags = Tag.page(params[:page])
    @top = "_top"
  end
  
  def about
  end
end
