require 'test_helper'

class ActiveSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @active_session = active_sessions(:one)
  end

  test "should get index" do
    get active_sessions_url, as: :json
    assert_response :success
  end

  test "should create active_session" do
    assert_difference('ActiveSession.count') do
      post active_sessions_url, params: { active_session: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show active_session" do
    get active_session_url(@active_session), as: :json
    assert_response :success
  end

  test "should update active_session" do
    patch active_session_url(@active_session), params: { active_session: {  } }, as: :json
    assert_response 200
  end

  test "should destroy active_session" do
    assert_difference('ActiveSession.count', -1) do
      delete active_session_url(@active_session), as: :json
    end

    assert_response 204
  end
end
