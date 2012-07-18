require 'test_helper'

class ExtractionsControllerTest < ActionController::TestCase
  setup do
    @extraction = extractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:extractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create extraction" do
    assert_difference('Extraction.count') do
      post :create, extraction: { culture_id: @extraction.culture_id, element_id: @extraction.element_id, extractionname: @extraction.extractionname, extractionnote: @extraction.extractionnote }
    end

    assert_redirected_to extraction_path(assigns(:extraction))
  end

  test "should show extraction" do
    get :show, id: @extraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @extraction
    assert_response :success
  end

  test "should update extraction" do
    put :update, id: @extraction, extraction: { culture_id: @extraction.culture_id, element_id: @extraction.element_id, extractionname: @extraction.extractionname, extractionnote: @extraction.extractionnote }
    assert_redirected_to extraction_path(assigns(:extraction))
  end

  test "should destroy extraction" do
    assert_difference('Extraction.count', -1) do
      delete :destroy, id: @extraction
    end

    assert_redirected_to extractions_path
  end
end
