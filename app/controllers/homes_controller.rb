class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @posts = Post.all
    @tags = Tag.all
  end
  
  def about
  end
end
