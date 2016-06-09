require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get second" do
    get :second
    assert_response :success
  end

end
