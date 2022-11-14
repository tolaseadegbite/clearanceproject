require "application_system_test_case"

class ClearancesTest < ApplicationSystemTestCase
  setup do
    @clearance = clearances(:one)
  end

  test "visiting the index" do
    visit clearances_url
    assert_selector "h1", text: "Clearances"
  end

  test "should create clearance" do
    visit clearances_url
    click_on "New clearance"

    fill_in "Degree", with: @clearance.degree
    fill_in "Link", with: @clearance.link
    fill_in "User", with: @clearance.user_id
    click_on "Create Clearance"

    assert_text "Clearance was successfully created"
    click_on "Back"
  end

  test "should update Clearance" do
    visit clearance_url(@clearance)
    click_on "Edit this clearance", match: :first

    fill_in "Degree", with: @clearance.degree
    fill_in "Link", with: @clearance.link
    fill_in "User", with: @clearance.user_id
    click_on "Update Clearance"

    assert_text "Clearance was successfully updated"
    click_on "Back"
  end

  test "should destroy Clearance" do
    visit clearance_url(@clearance)
    click_on "Destroy this clearance", match: :first

    assert_text "Clearance was successfully destroyed"
  end
end
