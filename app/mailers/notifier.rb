class Notifier < ActionMailer::Base
  default from: "testing@gmail.com"

  def comment_updated (comment, user)
    @comment = comment
    @user = user
    mail(:to => user.email,
         :from => "Ticketee <testing+#{comment.project.id}+#{comment.ticket_id}@paulcoates.com>",
         :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
  end
end
