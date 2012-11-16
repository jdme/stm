require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get create" do
    post :create, :user => {:email => @user.email, :password => @user.password}
    assert_response :redirect
    assert signed_in?
  end

  test "should get destroy" do
    sign_in @user
    get :destroy
    assert_response :redirect
    assert !signed_in?
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
