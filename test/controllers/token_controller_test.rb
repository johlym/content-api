require 'test_helper'

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get token_new_url
    assert_response :success
  end

  test "should get create" do
    get token_create_url
    assert_response :success
  end

  test "should get destroy" do
    get token_destroy_url
    assert_response :success
  end

  test "should get refresh" do
    get token_refresh_url
    assert_response :success
  end

  test "should get show" do
    get token_show_url
    assert_response :success
  end

end
