class MessageController < ApplicationController
    before_action :authenticate_user!

    def crt
        @chat = Chat.new(chat_params)
        @chat.user = current_user
        @chat.save

        MessageBroadcastJob.perform_later(@chat)

        respond_to do |format|
            format.js
        end
    end

    private
    def chat_params
        params.permit(:body, :room)
    end
end
