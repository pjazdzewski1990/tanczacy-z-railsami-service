require 'test_helper'

class UserProxiesControllerTest < ActionController::TestCase
  setup do
    @user_proxy = user_proxies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_proxies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_proxy" do
    assert_difference('UserProxy.count') do
      post :create, user_proxy: @user_proxy.attributes
    end

    assert_redirected_to user_proxy_path(assigns(:user_proxy))
  end

  test "should show user_proxy" do
    get :show, id: @user_proxy.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_proxy.to_param
    assert_response :success
  end

  test "should update user_proxy" do
    put :update, id: @user_proxy.to_param, user_proxy: @user_proxy.attributes
    assert_redirected_to user_proxy_path(assigns(:user_proxy))
  end

  test "should destroy user_proxy" do
    assert_difference('UserProxy.count', -1) do
      delete :destroy, id: @user_proxy.to_param
    end

    assert_redirected_to user_proxies_path
  end
end
