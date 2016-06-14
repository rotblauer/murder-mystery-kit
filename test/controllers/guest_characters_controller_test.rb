require 'test_helper'

class GuestCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest_character = guest_characters(:one)
  end

  test "should get index" do
    get guest_characters_url
    assert_response :success
  end

  test "should get new" do
    get new_guest_character_url
    assert_response :success
  end

  test "should create guest_character" do
    assert_difference('GuestCharacter.count') do
      post guest_characters_url, params: { guest_character: { character_id: @guest_character.character_id, guest_id: @guest_character.guest_id, index: @guest_character.index } }
    end

    assert_redirected_to guest_character_path(GuestCharacter.last)
  end

  test "should show guest_character" do
    get guest_character_url(@guest_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_guest_character_url(@guest_character)
    assert_response :success
  end

  test "should update guest_character" do
    patch guest_character_url(@guest_character), params: { guest_character: { character_id: @guest_character.character_id, guest_id: @guest_character.guest_id, index: @guest_character.index } }
    assert_redirected_to guest_character_path(@guest_character)
  end

  test "should destroy guest_character" do
    assert_difference('GuestCharacter.count', -1) do
      delete guest_character_url(@guest_character)
    end

    assert_redirected_to guest_characters_path
  end
end
