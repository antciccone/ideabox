require 'rails_helper'

RSpec.describe Category do
  context "validates" do
    scenario "is invalid without a name" do
      cateogry = Category.create

      expect(cateogry).to  be_invalid
    end

    scenario "user can not create the same category name" do
      category_one = Category.create(name: "Tech")
      category_two = Category.create(name: "Tech")

      expect(category_one).to be_valid
      expect(category_two).to be_invalid
    end
  end
end
