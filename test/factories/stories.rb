FactoryGirl.define do
  factory :story do
    title {generate :string}
    description {generate :string}
    status "new"
    order_by {generate :integer}
    user
  end
end