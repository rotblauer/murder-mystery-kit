require 'test_helper'

class EventCharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_character = event_characters(:one)
  end

  test "should get index" do
    get event_characters_url
    assert_response :success
  end

  test "should get new" do
    get new_event_character_url
    assert_response :success
  end

  test "should create event_character" do
    assert_difference('EventCharacter.count') do
      post event_characters_url, params: { event_character: { character_id: @event_character.character_id, event_id: @event_character.event_id, index: @event_character.index } }
    end

    assert_redirected_to event_character_path(EventCharacter.last)
  end

  test "should show event_character" do
    get event_character_url(@event_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_character_url(@event_character)
    assert_response :success
  end

  test "should update event_character" do
    patch event_character_url(@event_character), params: { event_character: { character_id: @event_character.character_id, event_id: @event_character.event_id, index: @event_character.index } }
    assert_redirected_to event_character_path(@event_character)
  end

  test "should destroy event_character" do
    assert_difference('EventCharacter.count', -1) do
      delete event_character_url(@event_character)
    end

    assert_redirected_to event_characters_path
  end
end
