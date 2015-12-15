class SendContactUsMessage
  include Interactor

  delegate :form, to: :context

  def call
    ContactUsMailer.delay.notify(form.full_name, form.email, form.phone_number, form.text) if form.valid?
  end
end
