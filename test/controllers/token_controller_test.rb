require 'test_helper'

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get token:string" do
    get token_token:string_url
    assert_response :success
  end

  test "should get user_id:references" do
    get token_user_id:references_url
    assert_response :success
  end

end
