require 'rails_helper'

describe "Creating a new category" do
  scenario "user can create a new category" do

    visit categories_path
    click_on "Create New Category"
    fill_in :Name, with: "Technology"
    click_button "Create Category"

    expect(page).to have_content "Technology"
    expect(current_path).to eq(category_path(Category.first))
  end
end
