require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get results_create_url
    assert_response :success
  end

end
