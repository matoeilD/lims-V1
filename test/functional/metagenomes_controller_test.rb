require 'test_helper'

class MetagenomesControllerTest < ActionController::TestCase
  setup do
    @metagenome = metagenomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metagenomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metagenome" do
    assert_difference('Metagenome.count') do
      post :create, metagenome: { data_id: @metagenome.data_id, meta_name: @metagenome.meta_name, meta_output: @metagenome.meta_output, meta_params: @metagenome.meta_params, meta_tools: @metagenome.meta_tools }
    end

    assert_redirected_to metagenome_path(assigns(:metagenome))
  end

  test "should show metagenome" do
    get :show, id: @metagenome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metagenome
    assert_response :success
  end

  test "should update metagenome" do
    put :update, id: @metagenome, metagenome: { data_id: @metagenome.data_id, meta_name: @metagenome.meta_name, meta_output: @metagenome.meta_output, meta_params: @metagenome.meta_params, meta_tools: @metagenome.meta_tools }
    assert_redirected_to metagenome_path(assigns(:metagenome))
  end

  test "should destroy metagenome" do
    assert_difference('Metagenome.count', -1) do
      delete :destroy, id: @metagenome
    end

    assert_redirected_to metagenomes_path
  end
end
