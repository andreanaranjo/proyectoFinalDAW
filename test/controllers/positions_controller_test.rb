require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = positions(:one)
  end

  test "should get index" do
    get positions_url, as: :json
    assert_response :success
  end

  test "should create position" do
    assert_difference('Position.count') do
      post positions_url, params: { position: { desc: @position.desc, name: @position.name } }, as: :json
    end

    assert_response 201
  end

  test "should show position" do
    get position_url(@position), as: :json
    assert_response :success
  end

  test "should update position" do
    patch position_url(@position), params: { position: { desc: @position.desc, name: @position.name } }, as: :json
    assert_response 200
  end

  test "should destroy position" do
    assert_difference('Position.count', -1) do
      delete position_url(@position), as: :json
    end

    assert_response 204
  end
end
