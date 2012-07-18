require 'test_helper'

class EmPcrsControllerTest < ActionController::TestCase
  setup do
    @em_pcr = em_pcrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:em_pcrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create em_pcr" do
    assert_difference('EmPcr.count') do
      post :create, em_pcr: { EM-PCR_name: @em_pcr.EM-PCR_name, PCR_round: @em_pcr.PCR_round, element_id: @em_pcr.element_id, library_id: @em_pcr.library_id }
    end

    assert_redirected_to em_pcr_path(assigns(:em_pcr))
  end

  test "should show em_pcr" do
    get :show, id: @em_pcr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @em_pcr
    assert_response :success
  end

  test "should update em_pcr" do
    put :update, id: @em_pcr, em_pcr: { EM-PCR_name: @em_pcr.EM-PCR_name, PCR_round: @em_pcr.PCR_round, element_id: @em_pcr.element_id, library_id: @em_pcr.library_id }
    assert_redirected_to em_pcr_path(assigns(:em_pcr))
  end

  test "should destroy em_pcr" do
    assert_difference('EmPcr.count', -1) do
      delete :destroy, id: @em_pcr
    end

    assert_redirected_to em_pcrs_path
  end
end
