require 'rails_helper'

describe "As a admin" do
  scenario "as an admin you can add a category" do
    admin = User.create(name: "Ant", email: "aciccone2014@gmail.com", password: "123", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_on "Create New Category"
    expect(current_path).to eq(new_admin_category_path)
    fill_in :Name, with: "Technology"
    click_button "Create Category"

    expect(page).to have_content "Technology"
  end
end
