require 'test_helper'

class SequencingsControllerTest < ActionController::TestCase
  setup do
    @sequencing = sequencings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequencings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequencing" do
    assert_difference('Sequencing.count') do
      post :create, sequencing: { EM-PCR_id: @sequencing.EM-PCR_id, distance_cassure: @sequencing.distance_cassure, element_id: @sequencing.element_id, paired-end: @sequencing.paired-end, sequencing_name: @sequencing.sequencing_name }
    end

    assert_redirected_to sequencing_path(assigns(:sequencing))
  end

  test "should show sequencing" do
    get :show, id: @sequencing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequencing
    assert_response :success
  end

  test "should update sequencing" do
    put :update, id: @sequencing, sequencing: { EM-PCR_id: @sequencing.EM-PCR_id, distance_cassure: @sequencing.distance_cassure, element_id: @sequencing.element_id, paired-end: @sequencing.paired-end, sequencing_name: @sequencing.sequencing_name }
    assert_redirected_to sequencing_path(assigns(:sequencing))
  end

  test "should destroy sequencing" do
    assert_difference('Sequencing.count', -1) do
      delete :destroy, id: @sequencing
    end

    assert_redirected_to sequencings_path
  end
end
