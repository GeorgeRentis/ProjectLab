
require 'spec_helper'

describe 'User registers'  do
  # context 'Registration Complete' do
  #   it 'visits homepage' do
  #     visit root_path
  #   end
  # end

  # context 'create user' do
  #   it "creates a user",js: true do
  #     visit new_user_user_path
  #     fill_in 'first_name',with: "George"
  #     fill_in 'user_last_name',with: "George"
  #     fill_in 'user_email',with: "arxhgos@arxhgos.com"
  #     fill_in 'user_password',with: "password"
  #     fill_in 'user_password_confirmation',with: "password"
  #     click_button 'Create User'
  #      # screenshot_and_open_image
  #     expect(page).to have_content "(Picture)"
  #   end
  # end

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
      fill_in "user_password",with: "password"
      fill_in "user_password_confirmation",with: "password"
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
      fill_in 'user_email',with: "arxhgos@arxhgos.com"
      fill_in 'user_password',with: "password"
      fill_in 'user_password_confirmation',with: "password"
      click_button 'Create User'
      click_on "Your Profile"
      click_on "New Lesson"
      fill_in "lesson_title",with: "Lesson"
      fill_in "lesson_description",with: "desc"
      fill_in "lesson_level",with: "Level"
      page.select "Math",from: "lesson_category_id"
      # find("lesson_category_id").find(:xpath,'option[2]').select_option
      click_button 'Create Lesson'
      sleep(5)
    end
  end








end