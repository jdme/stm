require 'test_helper'

class StoryCommentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in @user
    @comment = story_comments(:one)
  end

  test "should create story comment" do
    assert_difference('StoryComment.count') do
      post :create, :story_comment => {:comment => @comment.comment, :story_id => @comment.story_id,
                                       :user_id => @comment.user_id}
    end
    assert_redirected_to story_path(@comment.story)
  end

  test "should redirect to story" do
    get :index
    assert_redirected_to story_path(@comment.story)
  end

end
