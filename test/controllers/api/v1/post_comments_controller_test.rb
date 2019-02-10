require 'test_helper'

class Api::V1::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_post_comment = api_v1_post_comments(:one)
  end

  test "should get index" do
    get api_v1_post_comments_url, as: :json
    assert_response :success
  end

  test "should create api_v1_post_comment" do
    assert_difference('Api::V1::PostComment.count') do
      post api_v1_post_comments_url, params: { api_v1_post_comment: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_post_comment" do
    get api_v1_post_comment_url(@api_v1_post_comment), as: :json
    assert_response :success
  end

  test "should update api_v1_post_comment" do
    patch api_v1_post_comment_url(@api_v1_post_comment), params: { api_v1_post_comment: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_post_comment" do
    assert_difference('Api::V1::PostComment.count', -1) do
      delete api_v1_post_comment_url(@api_v1_post_comment), as: :json
    end

    assert_response 204
  end
end
