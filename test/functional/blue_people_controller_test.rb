require 'test_helper'

class BluePeopleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blue_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blue_person" do
    assert_difference('BluePerson.count') do
      post :create, :blue_person => { }
    end

    assert_redirected_to blue_person_path(assigns(:blue_person))
  end

  test "should show blue_person" do
    get :show, :id => blue_people(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => blue_people(:one).to_param
    assert_response :success
  end

  test "should update blue_person" do
    put :update, :id => blue_people(:one).to_param, :blue_person => { }
    assert_redirected_to blue_person_path(assigns(:blue_person))
  end

  test "should destroy blue_person" do
    assert_difference('BluePerson.count', -1) do
      delete :destroy, :id => blue_people(:one).to_param
    end

    assert_redirected_to blue_people_path
  end
end
