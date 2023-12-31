require "test_helper"

class Public::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_comments_create_url
    assert_response :success
  end

  test "should get dsetroy" do
    get public_comments_dsetroy_url
    assert_response :success
  end

  test "should get edit" do
    get public_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_comments_update_url
    assert_response :success
  end
end
