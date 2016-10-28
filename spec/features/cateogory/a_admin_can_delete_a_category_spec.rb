require 'rails_helper'

describe "Deletings a Category" do
  scenario "A admin can delete a category" do
    admin = User.create(name: "Ant", email: "aciccone2014@gmail.com", password: "123", role: 1)
    category_one = Category.create(name: "Technology")
    category_two = Category.create(name: "Mobile")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    first(:link, "Delete").click

    expect(page).to have_content "Mobile"
    expect(page).to_not have_content "Technology"
  end
end
