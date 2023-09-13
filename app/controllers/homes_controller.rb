class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @posts = Post.all
  end
  
  def about
  end
end
