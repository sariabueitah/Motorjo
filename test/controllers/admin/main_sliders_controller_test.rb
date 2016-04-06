require 'test_helper'

class Admin::MainSlidersControllerTest < ActionController::TestCase
  setup do
    @admin_main_slider = admin_main_sliders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_main_sliders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_main_slider" do
    assert_difference('Admin::MainSlider.count') do
      post :create, admin_main_slider: { description: @admin_main_slider.description, order: @admin_main_slider.order, title: @admin_main_slider.title }
    end

    assert_redirected_to admin_main_slider_path(assigns(:admin_main_slider))
  end

  test "should show admin_main_slider" do
    get :show, id: @admin_main_slider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_main_slider
    assert_response :success
  end

  test "should update admin_main_slider" do
    patch :update, id: @admin_main_slider, admin_main_slider: { description: @admin_main_slider.description, order: @admin_main_slider.order, title: @admin_main_slider.title }
    assert_redirected_to admin_main_slider_path(assigns(:admin_main_slider))
  end

  test "should destroy admin_main_slider" do
    assert_difference('Admin::MainSlider.count', -1) do
      delete :destroy, id: @admin_main_slider
    end

    assert_redirected_to admin_main_sliders_path
  end
end
