# spec/factories/contacts.rb
FactoryGirl.define do
  factory :user do |f|
    f.email "email@email.com"
    f.first_name "George"
    f.last_name "Rentis"
    f.password "password123"
    f.password_confirmation "password123"
  end
end

