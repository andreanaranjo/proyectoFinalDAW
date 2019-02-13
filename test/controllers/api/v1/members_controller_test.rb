require 'test_helper'

class Api::V1::MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = api_v1_members(:one)
  end

  test "should get index" do
    get api_v1_members_url, as: :json
    assert_response :success
  end

  test "should create api_v1_member" do
    assert_difference('Api::V1::Member.count') do
      post api_v1_members_url, params: {member: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_member" do
    get api_v1_member_url(@member), as: :json
    assert_response :success
  end

  test "should update api_v1_member" do
    patch api_v1_member_url(@member), params: {member: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_member" do
    assert_difference('Api::V1::Member.count', -1) do
      delete api_v1_member_url(@member), as: :json
    end

    assert_response 204
  end
end
