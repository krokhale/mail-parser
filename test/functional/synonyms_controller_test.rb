require 'test_helper'

class SynonymsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:synonyms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create synonym" do
    assert_difference('Synonym.count') do
      post :create, :synonym => { }
    end

    assert_redirected_to synonym_path(assigns(:synonym))
  end

  test "should show synonym" do
    get :show, :id => synonyms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => synonyms(:one).to_param
    assert_response :success
  end

  test "should update synonym" do
    put :update, :id => synonyms(:one).to_param, :synonym => { }
    assert_redirected_to synonym_path(assigns(:synonym))
  end

  test "should destroy synonym" do
    assert_difference('Synonym.count', -1) do
      delete :destroy, :id => synonyms(:one).to_param
    end

    assert_redirected_to synonyms_path
  end
end
