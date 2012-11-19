FactoryGirl.define do
  factory :story do
    title {generate :string}
    description {generate :string}
    status "N"
    order_by {generate :integer}
    user
  end
end