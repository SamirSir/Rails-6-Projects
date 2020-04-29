require "application_system_test_case"

class GallariesTest < ApplicationSystemTestCase
  setup do
    @gallary = gallaries(:one)
  end

  test "visiting the index" do
    visit gallaries_url
    assert_selector "h1", text: "Gallaries"
  end

  test "creating a Gallary" do
    visit gallaries_url
    click_on "New Gallary"

    fill_in "Detail", with: @gallary.detail
    fill_in "Name", with: @gallary.name
    click_on "Create Gallary"

    assert_text "Gallary was successfully created"
    click_on "Back"
  end

  test "updating a Gallary" do
    visit gallaries_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @gallary.detail
    fill_in "Name", with: @gallary.name
    click_on "Update Gallary"

    assert_text "Gallary was successfully updated"
    click_on "Back"
  end

  test "destroying a Gallary" do
    visit gallaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gallary was successfully destroyed"
  end
end
