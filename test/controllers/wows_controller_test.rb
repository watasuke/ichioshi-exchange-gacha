require 'test_helper'

class WowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get wows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get wows_destroy_url
    assert_response :success
  end

end
