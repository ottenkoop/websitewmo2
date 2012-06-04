class MentionMailer < ActionMailer::Base
  default :from => "wmocontact@gmail.com"
  default :to => "wmowgt@gmail.com"

  def new_message(mentionmessage)
    @metionmessage = mentionmessage
    mail(:subject => "Er is en melding ingediend #{message.subject}")
  end
end