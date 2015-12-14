class ContactUsController < ApplicationController
  respond_to :html

  def new
    @form = if user_signed_in?
      ContactUsForm.new(full_name: current_user.full_name, email: current_user.email)
    else
      ContactUsForm.new
    end
  end

  def create
    @form = ContactUsForm.new(form_params)
    send_message if @form.valid?

    respond_with @form, location: contact_us_path
  end

  private

  def form_params
    params.require(:contact_us_form).permit(:full_name, :email, :phone_number, :text)
  end

  def send_message
    ContactUsMailer.delay.notify(
      @form.full_name,
      @form.email,
      @form.phone_number,
      @form.text
    )
  end
end
