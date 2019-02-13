require 'test_helper'

class Api::V1::AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement = api_v1_announcements(:one)
  end

  test "should get index" do
    get api_v1_announcements_url, as: :json
    assert_response :success
  end

  test "should create api_v1_announcement" do
    assert_difference('Api::V1::Announcement.count') do
      post api_v1_announcements_url, params: {announcement: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_announcement" do
    get api_v1_announcement_url(@announcement), as: :json
    assert_response :success
  end

  test "should update api_v1_announcement" do
    patch api_v1_announcement_url(@announcement), params: {announcement: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_announcement" do
    assert_difference('Api::V1::Announcement.count', -1) do
      delete api_v1_announcement_url(@announcement), as: :json
    end

    assert_response 204
  end
end
