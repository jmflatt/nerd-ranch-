class BillMailer < ActionMailer::Base
  default from: "utilities-dashboard@example.com"

  def export(user, csv)
    attachments['bills.csv'] = csv
    mail to: user.email, subject: 'Your Bills Export Is Ready'
  end
end
