require 'rails_helper'

describe "Creating a new idea" do
  scenario "a user can create a new idea and give it a category" do

    User.create(name: "Ant", password: "123", email: "aciccone@bu.edu")
    visit login_path
    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Password, with: "123"
    click_button "Login"

    expect(current_path).to eq(user_path(User.last))

    category = Category.create(name: "Web Tech")
    category_two = Category.create(name: "Mobile Tech")

    click_link "New Idea"
    fill_in :Title, with: "Calendar App"
    fill_in :Notes, with: "test"

    select('Web Tech', :from => 'idea_category_id')
    click_button "Create Idea"

    expect(page).to have_content "Web Tech"
    expect(page).to have_content "Calendar App"
  end
end
