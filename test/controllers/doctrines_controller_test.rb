require 'test_helper'

class DoctrinesControllerTest < ActionController::TestCase
  setup do
    @doctrine = doctrines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctrines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctrine" do
    assert_difference('Doctrine.count') do
      post :create, doctrine: { category: @doctrine.category, explanation: @doctrine.explanation, title: @doctrine.title }
    end

    assert_redirected_to doctrine_path(assigns(:doctrine))
  end

  test "should show doctrine" do
    get :show, id: @doctrine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doctrine
    assert_response :success
  end

  test "should update doctrine" do
    patch :update, id: @doctrine, doctrine: { category: @doctrine.category, explanation: @doctrine.explanation, title: @doctrine.title }
    assert_redirected_to doctrine_path(assigns(:doctrine))
  end

  test "should destroy doctrine" do
    assert_difference('Doctrine.count', -1) do
      delete :destroy, id: @doctrine
    end

    assert_redirected_to doctrines_path
  end
end
