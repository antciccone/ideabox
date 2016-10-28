require 'rails_helper'

describe "Updating a Category" do
  scenario "A admin can edit a category" do
    admin = User.create(name: "Ant", email: "aciccone2014@gmail.com", password: "123", role: 1)
    category = Category.create(name: "Tech")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    click_on "Edit"
    fill_in :Name, with: "Construction"
    click_button "Update Category"

    expect(page).to have_content "Construction"
    expect(page).to_not have_content "Tech"
  end
end
