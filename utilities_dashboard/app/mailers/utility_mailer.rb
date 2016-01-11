class UtilityMailer < ActionMailer::Base
  default from: "utilities-dashboard@example.com"

  def sharing_notification(privilege, sharer)
    @sharer = sharer
    @utility = privilege.utility
    subject = "#{sharer.email} shared a utility with you"

    mail to: privilege.user.email, subject: subject
  end

  def unshared_utility(privilege, sharer)
    @sharer = sharer
    @utility = privilege.utility
    subject = "#{sharer.email} revoked sharing thier utilities with you"

    mail to: privilege.user.email, subject: subject
  end
end
