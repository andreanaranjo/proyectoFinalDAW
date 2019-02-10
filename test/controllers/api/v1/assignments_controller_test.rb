require 'test_helper'

class Api::V1::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_assignment = api_v1_assignments(:one)
  end

  test "should get index" do
    get api_v1_assignments_url, as: :json
    assert_response :success
  end

  test "should create api_v1_assignment" do
    assert_difference('Api::V1::Assignment.count') do
      post api_v1_assignments_url, params: { api_v1_assignment: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_assignment" do
    get api_v1_assignment_url(@api_v1_assignment), as: :json
    assert_response :success
  end

  test "should update api_v1_assignment" do
    patch api_v1_assignment_url(@api_v1_assignment), params: { api_v1_assignment: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_assignment" do
    assert_difference('Api::V1::Assignment.count', -1) do
      delete api_v1_assignment_url(@api_v1_assignment), as: :json
    end

    assert_response 204
  end
end
