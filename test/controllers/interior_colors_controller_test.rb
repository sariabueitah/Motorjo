require 'test_helper'

class InteriorColorsControllerTest < ActionController::TestCase
  setup do
    @interior_color = interior_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interior_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interior_color" do
    assert_difference('InteriorColor.count') do
      post :create, interior_color: { title: @interior_color.title }
    end

    assert_redirected_to interior_color_path(assigns(:interior_color))
  end

  test "should show interior_color" do
    get :show, id: @interior_color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interior_color
    assert_response :success
  end

  test "should update interior_color" do
    patch :update, id: @interior_color, interior_color: { title: @interior_color.title }
    assert_redirected_to interior_color_path(assigns(:interior_color))
  end

  test "should destroy interior_color" do
    assert_difference('InteriorColor.count', -1) do
      delete :destroy, id: @interior_color
    end

    assert_redirected_to interior_colors_path
  end
end
