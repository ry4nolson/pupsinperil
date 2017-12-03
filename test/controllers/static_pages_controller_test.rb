require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get adoptable_dogs" do
    get :adoptable_dogs
    assert_response :success
  end

  test "should get adoption" do
    get :adoption
    assert_response :success
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
  end

  test "should get foster" do
    get :foster
    assert_response :success
  end

  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get happy_tails" do
    get :happy_tails
    assert_response :success
  end

end
