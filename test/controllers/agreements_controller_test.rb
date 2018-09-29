require 'test_helper'

class AgreementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get agreements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get agreements_destroy_url
    assert_response :success
  end

end
