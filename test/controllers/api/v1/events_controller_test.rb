require 'test_helper'

class Api::V1::EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_event = api_v1_events(:one)
  end

  test "should get index" do
    get api_v1_events_url, as: :json
    assert_response :success
  end

  test "should create api_v1_event" do
    assert_difference('Api::V1::Event.count') do
      post api_v1_events_url, params: { api_v1_event: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_event" do
    get api_v1_event_url(@api_v1_event), as: :json
    assert_response :success
  end

  test "should update api_v1_event" do
    patch api_v1_event_url(@api_v1_event), params: { api_v1_event: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_event" do
    assert_difference('Api::V1::Event.count', -1) do
      delete api_v1_event_url(@api_v1_event), as: :json
    end

    assert_response 204
  end
end
