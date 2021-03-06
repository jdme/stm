FactoryGirl.define do
  factory :user do
    email
    password {generate :string}
    name {generate :name}
  end
end