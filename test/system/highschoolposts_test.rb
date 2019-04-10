require "application_system_test_case"

class HighschoolpostsTest < ApplicationSystemTestCase
  setup do
    @highschoolpost = highschoolposts(:one)
  end

  test "visiting the index" do
    visit highschoolposts_url
    assert_selector "h1", text: "Highschoolposts"
  end

  test "creating a Highschoolpost" do
    visit highschoolposts_url
    click_on "New Highschoolpost"

    fill_in "Body", with: @highschoolpost.body
    fill_in "Title", with: @highschoolpost.title
    click_on "Create Highschoolpost"

    assert_text "Highschoolpost was successfully created"
    click_on "Back"
  end

  test "updating a Highschoolpost" do
    visit highschoolposts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @highschoolpost.body
    fill_in "Title", with: @highschoolpost.title
    click_on "Update Highschoolpost"

    assert_text "Highschoolpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Highschoolpost" do
    visit highschoolposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Highschoolpost was successfully destroyed"
  end
end
