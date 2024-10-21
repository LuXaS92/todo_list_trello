FactoryBot.define do
  factory :card do
    title { "MyString" }
    description { "MyText" }
    position { 1 }
    list { nil }
  end
end
