require 'test_helper'

class SchoolControllerTest < ActionController::TestCase
  test "should get locations" do
    get :locations
    assert_response :success
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

  test "should get languages" do
    get :languages
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

end
