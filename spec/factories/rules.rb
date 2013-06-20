# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rule do
    book_id 1
    system_id 1
    name "MyString"
    description "MyText"
  end
end
