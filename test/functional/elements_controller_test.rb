require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  setup do
    @element = elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create element" do
    assert_difference('Element.count') do
      post :create, element: { elementnote: @element.elementnote }
    end

    assert_redirected_to element_path(assigns(:element))
  end

  test "should show element" do
    get :show, id: @element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @element
    assert_response :success
  end

  test "should update element" do
    put :update, id: @element, element: { elementnote: @element.elementnote }
    assert_redirected_to element_path(assigns(:element))
  end

  test "should destroy element" do
    assert_difference('Element.count', -1) do
      delete :destroy, id: @element
    end

    assert_redirected_to elements_path
  end
end
