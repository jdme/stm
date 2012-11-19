require 'test_helper'

class Stories::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @comment = FactoryGirl.create('story/comment')
  end

  test "should create story comment" do
    assert_difference('Story::Comment.count') do
      post :create, :story_id => @comment.story.id, :story_comment => {:comment => @comment.comment,
                                                                       :story_id => @comment.story_id,
                                                                       :user_id => @comment.user_id}
    end
    assert_redirected_to story_path(@comment.story)
  end

  test "should redirect to story" do
    get :index, :story_id => @comment.story.id
    assert_redirected_to story_path(@comment.story)
  end

end
