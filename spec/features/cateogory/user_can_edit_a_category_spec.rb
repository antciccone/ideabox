require 'rails_helper'

describe "Updating a Category" do
  scenario "A user can update a category" do
    category = Category.create(name: "Tech")

    visit categories_path
    click_on "Edit"
    fill_in :Name, with: "Construction"
    click_button "Update Category"

    expect(page).to have_content "Construction"
    expect(page).to_not have_content "Tech"
    expect(current_path).to eq(category_path(category))
  end
end
