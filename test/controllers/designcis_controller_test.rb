require 'test_helper'

class DesigncisControllerTest < ActionController::TestCase
  setup do
    @designci = designcis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:designcis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create designci" do
    assert_difference('Designci.count') do
      post :create, designci: { title: @designci.title }
    end

    assert_redirected_to designci_path(assigns(:designci))
  end

  test "should show designci" do
    get :show, id: @designci
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @designci
    assert_response :success
  end

  test "should update designci" do
    patch :update, id: @designci, designci: { title: @designci.title }
    assert_redirected_to designci_path(assigns(:designci))
  end

  test "should destroy designci" do
    assert_difference('Designci.count', -1) do
      delete :destroy, id: @designci
    end

    assert_redirected_to designcis_path
  end
end
