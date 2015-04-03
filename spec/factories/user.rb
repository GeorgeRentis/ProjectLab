# spec/factories/contacts.rb
FactoryGirl.define do
  factory :user do |f|
    f.email "email@email.com"
    f.first_name "George"
    f.last_name "Rentatoras"
    f.password "password"
    f.password_confirmation "password"
  end
end

