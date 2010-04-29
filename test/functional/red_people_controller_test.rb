require 'test_helper'

class RedPeopleControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:red_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create red_person" do
    assert_difference('RedPerson.count') do
      post :create, :red_person => { }
    end

    assert_redirected_to red_person_path(assigns(:red_person))
  end

  test "should show red_person" do
    get :show, :id => red_people(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => red_people(:one).to_param
    assert_response :success
  end

  test "should update red_person" do
    put :update, :id => red_people(:one).to_param, :red_person => { }
    assert_redirected_to red_person_path(assigns(:red_person))
  end

  test "should destroy red_person" do
    assert_difference('RedPerson.count', -1) do
      delete :destroy, :id => red_people(:one).to_param
    end

    assert_redirected_to red_people_path
  end
end
