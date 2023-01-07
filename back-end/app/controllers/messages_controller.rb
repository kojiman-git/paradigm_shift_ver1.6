class MessagesController < ApplicationController
  def create
    
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
   
      @message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))

      payload = { message: 'メッセージ作成できました'}
     
    else

      payload = { message: 'メッセージ作成できませんでした'}

    end

       render json: payload

  end
end
