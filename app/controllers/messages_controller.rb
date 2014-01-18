class MessagesController < ApplicationController
  def new
  end

  def index
      @messages = Message.all
  end
  
  def new
  end


  def create
        @message = Message.new(message_params)
        @message.save
        redirect_to action: 'index'
  end

  def get
  end

  private
    def message_params
        params.require(:message).permit(:lat,:long,:msg)
    end

end
