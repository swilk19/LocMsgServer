class MessagesController < ApplicationController
  
  wrap_parameters format: [:json, :xml]
  
  def new
  end

  def index
      @messages = Message.all
  end
  
  def new
  end


  def create_mobile
        @message = Message.new(ActiveSupport::JSON.decode(request.body.string))
        @message.save
        respond_to 
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
