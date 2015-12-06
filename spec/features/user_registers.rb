
require 'spec_helper'

describe 'User registers'  do

  context 'admin log in' do
    it 'logs in as admin',js: true do
      user = FactoryGirl.create(:user,role_id: "admin")
      visit root_path
      click_on "SIGN IN"
      fill_in "user_email",with: user.email
      fill_in "user_password",with: user.password
      click_button "Log in"
      click_on "Users"
      click_on "New User"
      fill_in "user_first_name",with: "George"
      fill_in "user_last_name",with: "George"
      fill_in "user_email",with: "arxhgos2@arxhgos2.com"
      fill_in "user_password",with: "password123"
      fill_in "user_password_confirmation",with: "password1234"
      click_button 'Create User'
      sleep(5)
    end
  end

  context 'create a lesson' do
    it "creates a lesson",js: true do
      FactoryGirl.create(:category)
      visit root_path
      click_button "Register Now"
      fill_in 'first_name',with: "George"
      fill_in 'user_last_name',with: "George"
      fill_in 'user_email',with: "email@email.com"
      fill_in 'user_password',with: "password123"
      fill_in 'user_password_confirmation',with: "password123"
      click_button 'Create User'
      click_on "Your Profile"
      click_on "New Lesson"
      fill_in "lesson_title",with: "Lesson"
      fill_in "lesson_description",with: "desc"
      page.select "Amateur",from: "lesson_level"
      page.select "Math",from: "lesson_category_id"
      click_button 'Create Lesson'
      sleep(5)
    end
  end

  context 'send a contact us message' do
    it "sends a contact us message",js: true  do
      visit root_path
      click_on "Contact Us"
      fill_in 'contact_message_first_name',with: "George"
      fill_in 'contact_message_last_name',with: "George"
      fill_in 'contact_message_subject',with: "Question"
      fill_in 'contact_message_email',with: "email@email.com"
      fill_in 'contact_message_message',with: "lorem ipsum"
      click_button 'Create Contact message'
      sleep(5)
    end
  end

end