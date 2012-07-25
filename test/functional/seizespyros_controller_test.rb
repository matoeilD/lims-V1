require 'test_helper'

class SeizespyrosControllerTest < ActionController::TestCase
  setup do
    @seizespyro = seizespyros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seizespyros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seizespyro" do
    assert_difference('Seizespyro.count') do
      post :create, seizespyro: { data_id: @seizespyro.data_id, seize_name: @seizespyro.seize_name, seize_output: @seizespyro.seize_output, seize_params: @seizespyro.seize_params, seize_tools: @seizespyro.seize_tools }
    end

    assert_redirected_to seizespyro_path(assigns(:seizespyro))
  end

  test "should show seizespyro" do
    get :show, id: @seizespyro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seizespyro
    assert_response :success
  end

  test "should update seizespyro" do
    put :update, id: @seizespyro, seizespyro: { data_id: @seizespyro.data_id, seize_name: @seizespyro.seize_name, seize_output: @seizespyro.seize_output, seize_params: @seizespyro.seize_params, seize_tools: @seizespyro.seize_tools }
    assert_redirected_to seizespyro_path(assigns(:seizespyro))
  end

  test "should destroy seizespyro" do
    assert_difference('Seizespyro.count', -1) do
      delete :destroy, id: @seizespyro
    end

    assert_redirected_to seizespyros_path
  end
end
