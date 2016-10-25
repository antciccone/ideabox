require 'rails_helper'

describe Idea do
  context "validations of presence" do
    scenario "idea is invalid with out a name and " do
    category = Category.create(name: "Web Dev")
    idea = Idea.create()
    idea_two = Idea.create(title: "App", notes: "notes", category_id: category.id)

    expect(idea).to be_invalid
    expect(idea_two).to be_valid
    end
  end
end
