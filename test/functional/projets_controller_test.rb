require 'test_helper'

class ProjetsControllerTest < ActionController::TestCase
  setup do
    @projet = projets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create projet" do
    assert_difference('Projet.count') do
      post :create, projet: { colourcode: @projet.colourcode, projectdescription: @projet.projectdescription, projectname: @projet.projectname }
    end

    assert_redirected_to projet_path(assigns(:projet))
  end

  test "should show projet" do
    get :show, id: @projet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projet
    assert_response :success
  end

  test "should update projet" do
    put :update, id: @projet, projet: { colourcode: @projet.colourcode, projectdescription: @projet.projectdescription, projectname: @projet.projectname }
    assert_redirected_to projet_path(assigns(:projet))
  end

  test "should destroy projet" do
    assert_difference('Projet.count', -1) do
      delete :destroy, id: @projet
    end

    assert_redirected_to projets_path
  end
end
