require 'test_helper'

class DppostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dppost = dpposts(:one)
  end

  test "should get index" do
    get dpposts_url
    assert_response :success
  end

  test "should get new" do
    get new_dppost_url
    assert_response :success
  end

  test "should create dppost" do
    assert_difference('Dppost.count') do
      post dpposts_url, params: { dppost: { body: @dppost.body, title: @dppost.title } }
    end

    assert_redirected_to dppost_url(Dppost.last)
  end

  test "should show dppost" do
    get dppost_url(@dppost)
    assert_response :success
  end

  test "should get edit" do
    get edit_dppost_url(@dppost)
    assert_response :success
  end

  test "should update dppost" do
    patch dppost_url(@dppost), params: { dppost: { body: @dppost.body, title: @dppost.title } }
    assert_redirected_to dppost_url(@dppost)
  end

  test "should destroy dppost" do
    assert_difference('Dppost.count', -1) do
      delete dppost_url(@dppost)
    end

    assert_redirected_to dpposts_url
  end
end
