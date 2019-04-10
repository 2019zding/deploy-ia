require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get middleSchool" do
    get static_pages_middleSchool_url
    assert_response :success
  end

  test "should get highSchool" do
    get static_pages_highSchool_url
    assert_response :success
  end

  test "should get admin" do
    get static_pages_admin_url
    assert_response :success
  end

end
