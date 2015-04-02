
#spec/models/user.rb
require 'rails_helper'

describe User do
  it "has a valid email" do
    FactoryGirl.create(:user).should be_valid
  end
  it "has invalid password" do
    FactoryGirl.build(:user,password: "pass").should_not be_valid
  end
  it "has to have a first name" do
    FactoryGirl.build(:user,first_name: nil).should_not be_valid
  end
  it "has invalid email(same email twice)" do
    FactoryGirl.create(:user)
    FactoryGirl.build(:user,email: "email@email.com").should_not be_valid
  end

end