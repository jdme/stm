require 'test_helper'

class Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @comment = FactoryGirl.create('story/comment')
    @story = @comment.story

    @params = {:story_id => @story.id}
  end

  test "should create story comment" do
    attrs = {:comment => FactoryGirl.generate(:string)}

    post :create, @params.merge(:story_comment => attrs)
    assert_response :redirect

    comment = @story.comments.find_by_comment(attrs[:comment])
    assert comment
  end

  test "should redirect to story" do
    get :index, :story_id => @comment.story.id
    assert_response :redirect
  end

end
