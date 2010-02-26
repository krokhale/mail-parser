require 'test_helper'

class MastersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create master" do
    assert_difference('Master.count') do
      post :create, :master => { }
    end

    assert_redirected_to master_path(assigns(:master))
  end

  test "should show master" do
    get :show, :id => masters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => masters(:one).to_param
    assert_response :success
  end

  test "should update master" do
    put :update, :id => masters(:one).to_param, :master => { }
    assert_redirected_to master_path(assigns(:master))
  end

  test "should destroy master" do
    assert_difference('Master.count', -1) do
      delete :destroy, :id => masters(:one).to_param
    end

    assert_redirected_to masters_path
  end
end
