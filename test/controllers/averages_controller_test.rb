require 'test_helper'

class AveragesControllerTest < ActionController::TestCase
  setup do
    @average = averages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:averages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create average" do
    assert_difference('Average.count') do
      post :create, average: {  }
    end

    assert_redirected_to average_path(assigns(:average))
  end

  test "should show average" do
    get :show, id: @average
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @average
    assert_response :success
  end

  test "should update average" do
    patch :update, id: @average, average: {  }
    assert_redirected_to average_path(assigns(:average))
  end

  test "should destroy average" do
    assert_difference('Average.count', -1) do
      delete :destroy, id: @average
    end

    assert_redirected_to averages_path
  end
end
