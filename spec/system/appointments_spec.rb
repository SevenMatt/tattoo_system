require 'rails_helper'

Rspec.describe Appointment, type: :system do
    before do
        driven_by(:rack_test)
    end

    it "creates an appointment via UI" do
        user = User.create!(name: "Matheus", email: "ui@teste.com")

        visit new_appointment_path

        fill_in "Title", with: "Tattoo"
        select "Matheus", from: "User"
        fill_in "Start time", with: Time.now.steftime("%Y-%m-%dT%H:%M")
        fill_in "End time", with: 1.hour.from_now.steftime("%Y-%m-%dT%H:%M")

        click_button "Create"

        expect(page).to have_content("Tattoo")
    end
end