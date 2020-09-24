class RoomController < ApplicationController
    before_action :authenticate_user!

    def show
        @user2 = User.find(params[:id])
        room1 = "#{current_user.email}_#{@user2.email}"
        room2 = "#{@user2.email}_#{current_user.email}"

        @chats = Chat.where(room: room1).or(Chat.where(room: room2))
        if @chats.count == 0
            @room = room1
        else
            @room = @chats[0].room
        end
        @chat = Chat.new
    end
end
