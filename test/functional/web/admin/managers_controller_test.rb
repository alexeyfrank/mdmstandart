require 'test_helper'

class Web::Admin::ManagersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
    @manager = create :manager
  end

  test "should get :index" do
    get :index
    assert_response :success
  end

  test "should get :new" do
    get :new
    assert_response :success
  end

  test "should get :edit" do
    get :edit, id: @manager.id
    assert_response :success
  end

  test "should post :create" do
    attrs = attributes_for :manager
    post :create, manager: attrs
    assert_response :redirect
    manager = Manager.find_by_full_name attrs[:full_name]
    assert manager
  end

  test "should put :update" do
    attrs = attributes_for :manager
    put :update, id: @manager.id, manager: attrs
    assert_response :redirect
    manager = Manager.find_by_full_name attrs[:full_name]
    assert manager == @manager
  end

  test "should delete :destroy" do
    delete :destroy, id: @manager.id
    assert_response :redirect
    assert !Manager.exists?(@manager)
  end
end
