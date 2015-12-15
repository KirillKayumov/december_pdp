class ContactUsController < ApplicationController
  respond_to :html

  def new
    @form = ContactUsForm.new(user: current_user)
  end

  def create
    @form = ContactUsForm.new(form_params)
    SendContactUsMessage.call(form: @form)

    respond_with @form, location: contact_us_path
  end

  private

  def form_params
    params.require(:contact_us_form).permit(:full_name, :email, :phone_number, :text)
  end
end
