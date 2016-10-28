require "rails_helper"

describe "Deleteing an idea" do
  scenario "a user can delete an idea" do
    user = User.create(name: "Ant", password: "1", email: "a@bu.edu", role: 0)
    category = Category.create(name: "Web Dev")
    idea_one = Idea.create(title: "App", notes: "notes", category_id: category.id, user_id: user.id)

    visit login_path
    fill_in :Email, with: "a@bu.edu"
    fill_in :Password, with: "1"
    click_button "Login"

    visit categories_path(category)
    click_on "Web Dev"
    expect(page).to have_content "App"

    click_on "Delete"
    expect(page).to_not have_content "App"

  end
end
