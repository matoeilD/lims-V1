require 'test_helper'

class GenomesControllerTest < ActionController::TestCase
  setup do
    @genome = genomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genome" do
    assert_difference('Genome.count') do
      post :create, genome: { data_id: @genome.data_id, genome_annotateur: @genome.genome_annotateur, genome_coverage: @genome.genome_coverage, genome_name: @genome.genome_name, genome_nbcontigs: @genome.genome_nbcontigs, genome_nbscaffold: @genome.genome_nbscaffold, genome_ncinquante: @genome.genome_ncinquante, genome_params: @genome.genome_params, genome_ref: @genome.genome_ref, genome_size: @genome.genome_size, genome_type: @genome.genome_type }
    end

    assert_redirected_to genome_path(assigns(:genome))
  end

  test "should show genome" do
    get :show, id: @genome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @genome
    assert_response :success
  end

  test "should update genome" do
    put :update, id: @genome, genome: { data_id: @genome.data_id, genome_annotateur: @genome.genome_annotateur, genome_coverage: @genome.genome_coverage, genome_name: @genome.genome_name, genome_nbcontigs: @genome.genome_nbcontigs, genome_nbscaffold: @genome.genome_nbscaffold, genome_ncinquante: @genome.genome_ncinquante, genome_params: @genome.genome_params, genome_ref: @genome.genome_ref, genome_size: @genome.genome_size, genome_type: @genome.genome_type }
    assert_redirected_to genome_path(assigns(:genome))
  end

  test "should destroy genome" do
    assert_difference('Genome.count', -1) do
      delete :destroy, id: @genome
    end

    assert_redirected_to genomes_path
  end
end
