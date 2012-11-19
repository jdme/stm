FactoryGirl.define do

  sequence :email do |n|
    "person-#{n}@example.com"
  end

  sequence :name do |n|
    "name-#{n}"
  end

  sequence :string do |n|
    "string-#{n}"
  end

  sequence :integer do |n|
    n
  end

end