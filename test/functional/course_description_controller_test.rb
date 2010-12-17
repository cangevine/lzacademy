require 'test_helper'

class CourseDescriptionControllerTest < ActionController::TestCase
  test "should get spanish_explorers" do
    get :spanish_explorers
    assert_response :success
  end

  test "should get spanish" do
    get :spanish
    assert_response :success
  end

  test "should get french" do
    get :french
    assert_response :success
  end

  test "should get latin" do
    get :latin
    assert_response :success
  end

  test "should get german" do
    get :german
    assert_response :success
  end

  test "should get italian" do
    get :italian
    assert_response :success
  end

  test "should get chinese" do
    get :chinese
    assert_response :success
  end

  test "should get arabic" do
    get :arabic
    assert_response :success
  end

  test "should get hebrew" do
    get :hebrew
    assert_response :success
  end

  test "should get ancient_greek" do
    get :ancient_greek
    assert_response :success
  end

  test "should get asl" do
    get :asl
    assert_response :success
  end

  test "should get russian" do
    get :russian
    assert_response :success
  end

end
