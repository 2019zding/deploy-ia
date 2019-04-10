require 'test_helper'

class HighschoolpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @highschoolpost = highschoolposts(:one)
  end

  test "should get index" do
    get highschoolposts_url
    assert_response :success
  end

  test "should get new" do
    get new_highschoolpost_url
    assert_response :success
  end

  test "should create highschoolpost" do
    assert_difference('Highschoolpost.count') do
      post highschoolposts_url, params: { highschoolpost: { body: @highschoolpost.body, title: @highschoolpost.title } }
    end

    assert_redirected_to highschoolpost_url(Highschoolpost.last)
  end

  test "should show highschoolpost" do
    get highschoolpost_url(@highschoolpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_highschoolpost_url(@highschoolpost)
    assert_response :success
  end

  test "should update highschoolpost" do
    patch highschoolpost_url(@highschoolpost), params: { highschoolpost: { body: @highschoolpost.body, title: @highschoolpost.title } }
    assert_redirected_to highschoolpost_url(@highschoolpost)
  end

  test "should destroy highschoolpost" do
    assert_difference('Highschoolpost.count', -1) do
      delete highschoolpost_url(@highschoolpost)
    end

    assert_redirected_to highschoolposts_url
  end
end
