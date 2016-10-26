require 'rails_helper'

describe  User do
  context "validations"
    it "a user needs an email, password, and name to be valud" do
      user_one = User.create(name: "Ant", password: "123", email: "aciccone@bu.edu")
      user_two = User.create(name: "Joe", password: "123")

      expect(user_one).to be_valid
      expect(user_two).to be_invalid
    end
  
    it "a user can not have the same email" do
      user_one = User.create(name: "Ant", password: "123", email: "aciccone@bu.edu")
      user_two = User.create(name: "Joe", password: "123", email: "aciccone@bu.edu")

      expect(user_one).to be_valid
      expect(user_two).to be_invalid
  end
end
