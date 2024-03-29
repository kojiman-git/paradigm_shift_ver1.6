class RoomsController < ApplicationController
  
  def create
    @room = Room.create(user_id: current_user.id)
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    
    payload = { RoomId: @room.id }
    render json: payload
  end

  def show
    @room = Room.find(params[:id])

    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @messageList = []
      @messages.each do |message|
        @messageList.push({id:message.id,userID:message.user_id,userName: message.user.name,userImage:message.user.image.thumb.url,roomId:message.room_id,Message:message.message,created_at:message.created_at.in_time_zone('Tokyo')})
      end
    end

    render json: @messageList
    
  end
end
