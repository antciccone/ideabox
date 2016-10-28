require 'rails_helper'

describe "Deletings a Category" do
  scenario "A user can delete a category" do
    category_one = Category.create(name: "Technology")
    category_two = Category.create(name: "Mobile")

    visit categories_path
    first(:link, "Delete").click

    expect(page).to have_content "Mobile"
    expect(page).to_not have_content "Technology"
  end
end
