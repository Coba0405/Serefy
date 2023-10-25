class Public::GroupMessagesController < ApplicationController
  def show
    
  end
  
  def create
    @group_message = current_user.group_messages.new(group_message_params)
    @group_message.group_id = params[:group_id]
    @group_message.save!
    redirect_to request.referer
  end
  
  private
  def group_message_params
    params.require(:group_message).permit(:message)
    
  end
end
