FactoryGirl.define do
  factory 'story/comment' do
    comment {generate :string}
    user
    story
  end
end