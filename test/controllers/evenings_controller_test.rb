require 'test_helper'

class EveningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evening = evenings(:one)
  end

  test "should get index" do
    get evenings_url
    assert_response :success
  end

  test "should get new" do
    get new_evening_url
    assert_response :success
  end

  test "should create evening" do
    assert_difference('Evening.count') do
      post evenings_url, params: { evening: { caveat: @evening.caveat, game_id: @evening.game_id, host_id: @evening.host_id, location: @evening.location } }
    end

    assert_redirected_to evening_path(Evening.last)
  end

  test "should show evening" do
    get evening_url(@evening)
    assert_response :success
  end

  test "should get edit" do
    get edit_evening_url(@evening)
    assert_response :success
  end

  test "should update evening" do
    patch evening_url(@evening), params: { evening: { caveat: @evening.caveat, game_id: @evening.game_id, host_id: @evening.host_id, location: @evening.location } }
    assert_redirected_to evening_path(@evening)
  end

  test "should destroy evening" do
    assert_difference('Evening.count', -1) do
      delete evening_url(@evening)
    end

    assert_redirected_to evenings_path
  end
end
