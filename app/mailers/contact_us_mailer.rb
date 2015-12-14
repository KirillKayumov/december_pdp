class ContactUsMailer < ActionMailer::Base
  ADMIN_EMAIL = ENV.fetch("ADMIN_EMAIL")
  CONTACT_US_FROM_EMAIL = ENV.fetch("CONTACT_US_FROM_EMAIL")

  def notify(full_name, email, phone_number, text)
    @full_name = full_name
    @email = email
    @phone_number = phone_number
    @text = text

    mail(
      to: ADMIN_EMAIL,
      from: CONTACT_US_FROM_EMAIL,
      subject: "New message from Contact Us"
    )
  end
end
