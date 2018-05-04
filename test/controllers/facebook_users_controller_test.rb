require 'test_helper'

class FacebookUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facebook_user = facebook_users(:one)
  end

  test "should get index" do
    get facebook_users_url, as: :json
    assert_response :success
  end

  test "should create facebook_user" do
    assert_difference('FacebookUser.count') do
      post facebook_users_url, params: { facebook_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show facebook_user" do
    get facebook_user_url(@facebook_user), as: :json
    assert_response :success
  end

  test "should update facebook_user" do
    patch facebook_user_url(@facebook_user), params: { facebook_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy facebook_user" do
    assert_difference('FacebookUser.count', -1) do
      delete facebook_user_url(@facebook_user), as: :json
    end

    assert_response 204
  end
end
