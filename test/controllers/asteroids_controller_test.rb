require "test_helper"

class AsteroidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asteroid = asteroids(:one)
  end

  test "should get index" do
    get asteroids_url, as: :json
    assert_response :success
  end

  test "should create asteroid" do
    assert_difference("Asteroid.count") do
      post asteroids_url, params: { asteroid: {} }, as: :json
    end

    assert_response :created
  end

  test "should show asteroid" do
    get asteroid_url(@asteroid), as: :json
    assert_response :success
  end

  test "should update asteroid" do
    patch asteroid_url(@asteroid), params: { asteroid: {} }, as: :json
    assert_response :success
  end

  test "should destroy asteroid" do
    assert_difference("Asteroid.count", -1) do
      delete asteroid_url(@asteroid), as: :json
    end

    assert_response :no_content
  end
end
