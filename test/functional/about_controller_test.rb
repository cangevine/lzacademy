require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get philosophy" do
    get :philosophy
    assert_response :success
  end

  test "should get us" do
    get :us
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
