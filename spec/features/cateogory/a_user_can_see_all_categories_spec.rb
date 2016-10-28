require 'rails_helper'

describe "Categories" do
  scenario "a user can view all categories" do
    Category.create(name: "Web Applications")
    Category.create(name: "Mobile Technology")
    Category.create(name: "Electronics")

    visit categories_path

    expect(page).to have_content "List of Categories"
    expect(page).to have_content "Web Applications"
    expect(page).to have_content "Mobile Technology"
    expect(page).to have_content "Electronics"
  end
end
