require 'test_helper'

class Stories::StatusesControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @story = FactoryGirl.create(:story)
  end

  test "should redirect" do
    put :update, story_id: @story.id, story: { event: 'finish' }
    assert_response :redirect
  end

end
