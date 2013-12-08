require 'test_helper'

class SecondariesControllerTest < ActionController::TestCase
  setup do
    @secondary = secondaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:secondaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create secondary" do
    assert_difference('Secondary.count') do
      post :create, secondary: {  }
    end

    assert_redirected_to secondary_path(assigns(:secondary))
  end

  test "should show secondary" do
    get :show, id: @secondary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @secondary
    assert_response :success
  end

  test "should update secondary" do
    patch :update, id: @secondary, secondary: {  }
    assert_redirected_to secondary_path(assigns(:secondary))
  end

  test "should destroy secondary" do
    assert_difference('Secondary.count', -1) do
      delete :destroy, id: @secondary
    end

    assert_redirected_to secondaries_path
  end
end
