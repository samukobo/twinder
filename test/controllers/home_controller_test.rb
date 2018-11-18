require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get home_all_url
    assert_response :success
  end

end
