require 'test_helper'

class LandmastersControllerTest < ActionController::TestCase
  setup do
    @landmaster = landmasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landmasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landmaster" do
    assert_difference('Landmaster.count') do
      post :create, landmaster: {  }
    end

    assert_redirected_to landmaster_path(assigns(:landmaster))
  end

  test "should show landmaster" do
    get :show, id: @landmaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @landmaster
    assert_response :success
  end

  test "should update landmaster" do
    patch :update, id: @landmaster, landmaster: {  }
    assert_redirected_to landmaster_path(assigns(:landmaster))
  end

  test "should destroy landmaster" do
    assert_difference('Landmaster.count', -1) do
      delete :destroy, id: @landmaster
    end

    assert_redirected_to landmasters_path
  end
end
