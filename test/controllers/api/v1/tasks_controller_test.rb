require 'test_helper'

class Api::V1::TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_task = api_v1_tasks(:one)
  end

  test "should get index" do
    get api_v1_tasks_url, as: :json
    assert_response :success
  end

  test "should create api_v1_task" do
    assert_difference('Api::V1::Task.count') do
      post api_v1_tasks_url, params: { api_v1_task: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_task" do
    get api_v1_task_url(@api_v1_task), as: :json
    assert_response :success
  end

  test "should update api_v1_task" do
    patch api_v1_task_url(@api_v1_task), params: { api_v1_task: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_task" do
    assert_difference('Api::V1::Task.count', -1) do
      delete api_v1_task_url(@api_v1_task), as: :json
    end

    assert_response 204
  end
end
