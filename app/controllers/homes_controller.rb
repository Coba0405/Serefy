class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @posts = Post.page(params[:page])
    @tags = Tag.all
  end
  
  def about
  end
end
