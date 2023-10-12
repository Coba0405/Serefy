class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  # アクション実行前にユーザーの認証を確認し、ログインしていない場合ユーザーを認証するように要求する
  before_action :ensure_correct_user, only: [:edit, :update]
  # editとuppdateの時のみ:ensure_correct_userメソッドを呼び出すように指示
  # ensure_corrent_userメソッドはユーザーが適切な権限を持っているかを確認するために使われる
  def new
    @group = Group.new
  end
  
  def index
    @groups = Group.all
    # @group = Group.find(params[:id])
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.genre_id = params[:group][:genre_id]
    # フォームから送信された genre_idを設定
    @group.users << current_user
    # <<によって左側の要素に右側の要素を追加するために使用
      if @group.save
        redirect_to public_group_path(@group)
      else
        render 'new'
      end
  end
  
  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @group = group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  
  private
  
  def group_params
    params.require(:group).permit(:group_name, :introduction, :image)
  end
  
  def ensure_corrent_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end