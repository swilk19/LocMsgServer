require 'geokit-rails'

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
        render :json => @message
  end
  
  def create
        @message = Message.new(message_params)
        @message.save
        redirect_to action: 'index'
  end

  def find
        #This should come posted with a radius, lat, long. Output: all points within R miles of lat/long.
        r = params[:r]
        lat = params[:lat]
        long = params[:long]
        @message = Message.within(r, :origin => [lat, long]).all
        render :json => @message
  end

  private
    def message_params
        params.require(:message).permit(:lat,:long,:msg)
    end


end
