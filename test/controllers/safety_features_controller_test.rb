require 'test_helper'

class SafetyFeaturesControllerTest < ActionController::TestCase
  setup do
    @safety_feature = safety_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:safety_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create safety_feature" do
    assert_difference('SafetyFeature.count') do
      post :create, safety_feature: { title: @safety_feature.title }
    end

    assert_redirected_to safety_feature_path(assigns(:safety_feature))
  end

  test "should show safety_feature" do
    get :show, id: @safety_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @safety_feature
    assert_response :success
  end

  test "should update safety_feature" do
    patch :update, id: @safety_feature, safety_feature: { title: @safety_feature.title }
    assert_redirected_to safety_feature_path(assigns(:safety_feature))
  end

  test "should destroy safety_feature" do
    assert_difference('SafetyFeature.count', -1) do
      delete :destroy, id: @safety_feature
    end

    assert_redirected_to safety_features_path
  end
end
