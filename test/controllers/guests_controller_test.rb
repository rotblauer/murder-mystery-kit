require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get guests_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post guests_url, params: { guest: { character_id: @guest.character_id, email: @guest.email, evening_id: @guest.evening_id, name: @guest.name, phone_number: @guest.phone_number } }
    end

    assert_redirected_to guest_path(Guest.last)
  end

  test "should show guest" do
    get guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    patch guest_url(@guest), params: { guest: { character_id: @guest.character_id, email: @guest.email, evening_id: @guest.evening_id, name: @guest.name, phone_number: @guest.phone_number } }
    assert_redirected_to guest_path(@guest)
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete guest_url(@guest)
    end

    assert_redirected_to guests_path
  end
end
