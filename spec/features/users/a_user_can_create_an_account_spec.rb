require 'rails_helper'

describe "Creating a account" do
  scenario "a user can creaet an account" do

    visit new_user_path
    fill_in :Name, with: "Anthony"
    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Password, with: "123"
    fill_in "user[password_confirmation]", with: "123"
    click_button "Create User"

    expect(current_path).to eq(user_path(User.first))
    expect(page).to have_content "Welcome Anthony!"
    expect(page).to have_content "You have successfully created a user"
  end

  scenario "a user fails to login when password confirmation does not match password" do

    visit new_user_path
    fill_in :Name, with: "Anthony"
    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Password, with: "123"
    fill_in "user[password_confirmation]", with: "121"
    click_button "Create User"

    expect(current_path).to eq(new_user_path)
  end

  scenario "a user fails to login when when that email already exists" do
    User.create(name: "Ant", email: "aciccone@bu.edu", password: "123")

    visit new_user_path
    fill_in :Name, with: "Anthony"
    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Password, with: "123"
    fill_in "user[password_confirmation]", with: "121"
    click_button "Create User"

    expect(current_path).to eq(new_user_path)
  end
end
