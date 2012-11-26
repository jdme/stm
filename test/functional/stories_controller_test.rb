require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @story = FactoryGirl.create(:story)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post :create, story: { description: @story.description, order_by: @story.order_by, title: @story.title, user_id: @story.user_id }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "should show story" do
    get :show, id: @story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story
    assert_response :success
  end

  test "should update story" do
    put :update, id: @story, story: { description: @story.description, order_by: @story.order_by, title: @story.title, user_id: @story.user_id }
    assert_redirected_to story_path(assigns(:story))
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end

  test "should redirect and status change" do
    put :change_status, id: @story, story: { status_event: 'start' }
    assert_response :redirect
    @story.reload
    assert_equal @story.status, 'started'
  end

end
