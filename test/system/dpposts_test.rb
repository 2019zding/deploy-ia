require "application_system_test_case"

class DppostsTest < ApplicationSystemTestCase
  setup do
    @dppost = dpposts(:one)
  end

  test "visiting the index" do
    visit dpposts_url
    assert_selector "h1", text: "Dpposts"
  end

  test "creating a Dppost" do
    visit dpposts_url
    click_on "New Dppost"

    fill_in "Body", with: @dppost.body
    fill_in "Title", with: @dppost.title
    click_on "Create Dppost"

    assert_text "Dppost was successfully created"
    click_on "Back"
  end

  test "updating a Dppost" do
    visit dpposts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @dppost.body
    fill_in "Title", with: @dppost.title
    click_on "Update Dppost"

    assert_text "Dppost was successfully updated"
    click_on "Back"
  end

  test "destroying a Dppost" do
    visit dpposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dppost was successfully destroyed"
  end
end
