require 'test_helper'

class ComfortInteriorsControllerTest < ActionController::TestCase
  setup do
    @comfort_interior = comfort_interiors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comfort_interiors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comfort_interior" do
    assert_difference('ComfortInterior.count') do
      post :create, comfort_interior: { title: @comfort_interior.title }
    end

    assert_redirected_to comfort_interior_path(assigns(:comfort_interior))
  end

  test "should show comfort_interior" do
    get :show, id: @comfort_interior
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comfort_interior
    assert_response :success
  end

  test "should update comfort_interior" do
    patch :update, id: @comfort_interior, comfort_interior: { title: @comfort_interior.title }
    assert_redirected_to comfort_interior_path(assigns(:comfort_interior))
  end

  test "should destroy comfort_interior" do
    assert_difference('ComfortInterior.count', -1) do
      delete :destroy, id: @comfort_interior
    end

    assert_redirected_to comfort_interiors_path
  end
end
