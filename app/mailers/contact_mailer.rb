class ContactMailer < ActionMailer::Base
  default :from => "wmocontact@gmail.com"
  default :to => "wmowgt@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Contactformulier is ingevuld #{message.subject}")
  end

end