require "rails_helper"

feature "Contact Us form" do
  scenario "Guest sends message" do
    visit contact_us_path

    fill_in "contact_us_form_full_name", with: "Kendrick Lamar"
    fill_in "contact_us_form_email", with: "k.lamar@rap.com"
    fill_in "contact_us_form_text", with: "Hello!"
    click_button "Send message"

    expect(page).to have_content("Your message was sent!")
  end

  context "when user is signed in" do
    let(:user) { create :user, full_name: "XZibit", email: "pimpmyride@rap.com" }

    background do
      login_as user
    end

    scenario "User sends message" do
      visit contact_us_path

      expect(page).to have_field("contact_us_form_full_name", with: "XZibit")
      expect(page).to have_field("contact_us_form_email", with: "pimpmyride@rap.com")

      fill_in "contact_us_form_text", with: "Hello!"
      click_button "Send message"

      expect(page).to have_content("Your message was sent!")
    end
  end
end
