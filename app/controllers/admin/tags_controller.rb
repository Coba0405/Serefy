class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @tag = Tag.new
    @tags = Tag.page(params[:page]).per(5)
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      @tags = Tag.page(params[:page])
      render :index
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path
  end
  
  private
  def tag_params
    params.require(:tag).permit(:tag_type, :tag_ids)
  end
end
