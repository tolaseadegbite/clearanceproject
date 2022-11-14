require "test_helper"

class ClearancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clearance = clearances(:one)
  end

  test "should get index" do
    get clearances_url
    assert_response :success
  end

  test "should get new" do
    get new_clearance_url
    assert_response :success
  end

  test "should create clearance" do
    assert_difference("Clearance.count") do
      post clearances_url, params: { clearance: { degree: @clearance.degree, link: @clearance.link, user_id: @clearance.user_id } }
    end

    assert_redirected_to clearance_url(Clearance.last)
  end

  test "should show clearance" do
    get clearance_url(@clearance)
    assert_response :success
  end

  test "should get edit" do
    get edit_clearance_url(@clearance)
    assert_response :success
  end

  test "should update clearance" do
    patch clearance_url(@clearance), params: { clearance: { degree: @clearance.degree, link: @clearance.link, user_id: @clearance.user_id } }
    assert_redirected_to clearance_url(@clearance)
  end

  test "should destroy clearance" do
    assert_difference("Clearance.count", -1) do
      delete clearance_url(@clearance)
    end

    assert_redirected_to clearances_url
  end
end
