require "rails_helper"

describe "Deleteing an idea" do
  scenario "a user can delete an idea" do
    category = Category.create(name: "Web Dev")
    idea_one = Idea.create(title: "App", notes: "notes", category_id: category.id)

    visit category_path(category)
    click_on "App"
    expect(page).to have_content "App"
    click_on "Delete"

    expect(page).to_not have_content "App"
    expect(current_path).to eq(category_path(category))
  end
end
