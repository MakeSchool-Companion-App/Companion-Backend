require 'test_helper'

class BeaconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beacon = beacons(:one)
  end

  test "should get index" do
    get beacons_url, as: :json
    assert_response :success
  end

  test "should create beacon" do
    assert_difference('Beacon.count') do
      post beacons_url, params: { beacon: { hardware_id: @beacon.hardware_id, title: @beacon.title } }, as: :json
    end

    assert_response 201
  end

  test "should show beacon" do
    get beacon_url(@beacon), as: :json
    assert_response :success
  end

  test "should update beacon" do
    patch beacon_url(@beacon), params: { beacon: { hardware_id: @beacon.hardware_id, title: @beacon.title } }, as: :json
    assert_response 200
  end

  test "should destroy beacon" do
    assert_difference('Beacon.count', -1) do
      delete beacon_url(@beacon), as: :json
    end

    assert_response 204
  end
end
