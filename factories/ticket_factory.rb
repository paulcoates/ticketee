Factory.define :ticket do |ticket|
  ticket.title "A title"
  ticket.description "A ticket, nothing more"
  ticket.user { |u| u.assocation(:user) }
  ticket.project { |p| p.association(:project) }
end