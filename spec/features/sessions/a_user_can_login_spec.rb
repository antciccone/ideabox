require 'rails_helper'

describe "Logging In" do
  scenario "a user can loggin" do
    User.create(name: "Ant", password: "123", email: "aciccone@bu.edu")

    visit login_path
    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Password, with: "123"
    click_button "Login"

    expect(page).to have_content "Welcome Ant!"
    expect(page).to have_content "You Successfully Logged in!"
  end
end
