class MentionController < ApplicationController

  def new
    @mentionmessage = Mentionmessage.new
  end

  def create
    @mentionmessage = Mentionmessage.new(params[:mentionmessage])
    
    if @mentionmessage.valid?
      MentionMailer.new_message(@mentionmessage).deliver
      redirect_to(meldpunt_path, :notice => "Bericht verzonden!")
    else
      flash.now.alert = "Niet alles is ingevuld"
      render :mention_new
    end
  end

end
