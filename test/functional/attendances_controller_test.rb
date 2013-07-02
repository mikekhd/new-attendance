require 'test_helper'

class AttendancesControllerTest < ActionController::TestCase
  test "should get user_id:integer" do
    get :user_id:integer
    assert_response :success
  end

  test "should get login:datetime" do
    get :login:datetime
    assert_response :success
  end

  test "should get logout:datetime" do
    get :logout:datetime
    assert_response :success
  end

end
