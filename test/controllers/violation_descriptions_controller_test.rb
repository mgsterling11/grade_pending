require 'test_helper'

class ViolationDescriptionsControllerTest < ActionController::TestCase
  setup do
    @violation_description = violation_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:violation_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create violation_description" do
    assert_difference('ViolationDescription.count') do
      post :create, violation_description: { restaurant_id: @violation_description.restaurant_id, violation_code: @violation_description.violation_code, violation_description: @violation_description.violation_description }
    end

    assert_redirected_to violation_description_path(assigns(:violation_description))
  end

  test "should show violation_description" do
    get :show, id: @violation_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @violation_description
    assert_response :success
  end

  test "should update violation_description" do
    patch :update, id: @violation_description, violation_description: { restaurant_id: @violation_description.restaurant_id, violation_code: @violation_description.violation_code, violation_description: @violation_description.violation_description }
    assert_redirected_to violation_description_path(assigns(:violation_description))
  end

  test "should destroy violation_description" do
    assert_difference('ViolationDescription.count', -1) do
      delete :destroy, id: @violation_description
    end

    assert_redirected_to violation_descriptions_path
  end
end
