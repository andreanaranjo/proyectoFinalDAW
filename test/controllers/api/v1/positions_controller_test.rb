require 'test_helper'

class Api::V1::PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = api_v1_positions(:one)
  end

  test "should get index" do
    get api_v1_positions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_position" do
    assert_difference('Api::V1::Position.count') do
      post api_v1_positions_url, params: {position: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_position" do
    get api_v1_position_url(@position), as: :json
    assert_response :success
  end

  test "should update api_v1_position" do
    patch api_v1_position_url(@position), params: {position: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_position" do
    assert_difference('Api::V1::Position.count', -1) do
      delete api_v1_position_url(@position), as: :json
    end

    assert_response 204
  end
end
