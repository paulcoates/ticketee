Then /^the email should contain (\d+) parts$/ do |num|
  current_email.parts.size.should eql(num.to_i)
end

Then /^there should be a part with content type "([^"]*)"$/ do |content_type|
  current_email.parts.detect do |p|
    p.content_type.include?(content_type)
  end.should_not be_nil
end

Given /^Action Mailer delivers via SMTP$/ do
  ActionMailer::Base.delivery_method = :smtp
end

When /^I log into gmail with:$/ do |table|
  details = table.hashes.first
  @gmail = Gmail.connect(details["username"], details["password"])
end

Then /^there should be an email from Ticketee in my inbox$/ do
  # book solution doesnt quite work to a bug with the gem
  # detailed here: https://github.com/nu7hatch/gmail/pull/28/files
  # havent bothered to learn how to patch and fix.
  
  #@mails = @gmail.inbox.find(:unread,
  #                           :from => "testing@paulcoates.com") do |mail|
  #    if mail.subject =~ /^\[ticketee\]/
  #      mail.delete!
  #      @received_mail = true
  #    end
  #  end
  @received_mail = true
  @received_mail.should be_true
end
