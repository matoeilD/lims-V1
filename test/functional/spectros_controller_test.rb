require 'test_helper'

class SpectrosControllerTest < ActionController::TestCase
  setup do
    @spectro = spectros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spectros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spectro" do
    assert_difference('Spectro.count') do
      post :create, spectro: { analyse_type: @spectro.analyse_type, attached_files: @spectro.attached_files, comments: @spectro.comments, culture_id: @spectro.culture_id, element_id: @spectro.element_id, gel_number: @spectro.gel_number, probe_number: @spectro.probe_number, procedure: @spectro.procedure, sample_type: @spectro.sample_type, samples_number: @spectro.samples_number, spectro_name: @spectro.spectro_name }
    end

    assert_redirected_to spectro_path(assigns(:spectro))
  end

  test "should show spectro" do
    get :show, id: @spectro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spectro
    assert_response :success
  end

  test "should update spectro" do
    put :update, id: @spectro, spectro: { analyse_type: @spectro.analyse_type, attached_files: @spectro.attached_files, comments: @spectro.comments, culture_id: @spectro.culture_id, element_id: @spectro.element_id, gel_number: @spectro.gel_number, probe_number: @spectro.probe_number, procedure: @spectro.procedure, sample_type: @spectro.sample_type, samples_number: @spectro.samples_number, spectro_name: @spectro.spectro_name }
    assert_redirected_to spectro_path(assigns(:spectro))
  end

  test "should destroy spectro" do
    assert_difference('Spectro.count', -1) do
      delete :destroy, id: @spectro
    end

    assert_redirected_to spectros_path
  end
end
