require 'test_helper'

class InteriorDesignsControllerTest < ActionController::TestCase
  setup do
    @interior_design = interior_designs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interior_designs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interior_design" do
    assert_difference('InteriorDesign.count') do
      post :create, interior_design: { title: @interior_design.title }
    end

    assert_redirected_to interior_design_path(assigns(:interior_design))
  end

  test "should show interior_design" do
    get :show, id: @interior_design
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interior_design
    assert_response :success
  end

  test "should update interior_design" do
    patch :update, id: @interior_design, interior_design: { title: @interior_design.title }
    assert_redirected_to interior_design_path(assigns(:interior_design))
  end

  test "should destroy interior_design" do
    assert_difference('InteriorDesign.count', -1) do
      delete :destroy, id: @interior_design
    end

    assert_redirected_to interior_designs_path
  end
end
