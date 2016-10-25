require 'rails_helper'

RSpec.describe Category do
  context "validates" do
    scenario "is invalid without a name" do
      cateogry = Category.create

      expect(cateogry).to  be_invalid
    end

    scenario "user can not create the same "
  end
end
