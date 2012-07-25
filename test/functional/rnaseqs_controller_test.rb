require 'test_helper'

class RnaseqsControllerTest < ActionController::TestCase
  setup do
    @rnaseq = rnaseqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rnaseqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rnaseq" do
    assert_difference('Rnaseq.count') do
      post :create, rnaseq: { data_id: @rnaseq.data_id, rnaseq_name: @rnaseq.rnaseq_name, rnaseq_output: @rnaseq.rnaseq_output, rnaseq_params: @rnaseq.rnaseq_params, rnaseq_ref: @rnaseq.rnaseq_ref, rnaseq_tablecount: @rnaseq.rnaseq_tablecount, rnaseq_tools: @rnaseq.rnaseq_tools }
    end

    assert_redirected_to rnaseq_path(assigns(:rnaseq))
  end

  test "should show rnaseq" do
    get :show, id: @rnaseq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rnaseq
    assert_response :success
  end

  test "should update rnaseq" do
    put :update, id: @rnaseq, rnaseq: { data_id: @rnaseq.data_id, rnaseq_name: @rnaseq.rnaseq_name, rnaseq_output: @rnaseq.rnaseq_output, rnaseq_params: @rnaseq.rnaseq_params, rnaseq_ref: @rnaseq.rnaseq_ref, rnaseq_tablecount: @rnaseq.rnaseq_tablecount, rnaseq_tools: @rnaseq.rnaseq_tools }
    assert_redirected_to rnaseq_path(assigns(:rnaseq))
  end

  test "should destroy rnaseq" do
    assert_difference('Rnaseq.count', -1) do
      delete :destroy, id: @rnaseq
    end

    assert_redirected_to rnaseqs_path
  end
end
