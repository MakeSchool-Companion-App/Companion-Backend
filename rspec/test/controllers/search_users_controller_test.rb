require 'test_helper'

class SearchUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_user = search_users(:one)
  end

  test "should get index" do
    get search_users_url, as: :json
    assert_response :success
  end

  test "should create search_user" do
    assert_difference('SearchUser.count') do
      post search_users_url, params: { search_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show search_user" do
    get search_user_url(@search_user), as: :json
    assert_response :success
  end

  test "should update search_user" do
    patch search_user_url(@search_user), params: { search_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy search_user" do
    assert_difference('SearchUser.count', -1) do
      delete search_user_url(@search_user), as: :json
    end

    assert_response 204
  end
end
