class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    ActionCable.server.broadcast "#{message.room}", {
      message: render_message(message)
    }
  end

  private
  def render_message(message)
    MessageController.render(
      partial: 'room/chat',
      locals: {
        chat: message
      }
    )
  end
end
