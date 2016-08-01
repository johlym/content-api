require 'test_helper'

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get token_create_url
    assert_response :success
  end

  test "should get read" do
    get token_read_url
    assert_response :success
  end

  test "should get update" do
    get token_update_url
    assert_response :success
  end

  test "should get delete" do
    get token_delete_url
    assert_response :success
  end

end
