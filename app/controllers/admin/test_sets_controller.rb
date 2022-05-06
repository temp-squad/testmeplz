class Admin::TestSetsController < Admin::BaseController
  def new
    @test_set = current_company.test_sets.new
  end

  def index
    @test_sets = current_company.test_sets
  end

  def create
    @test_set = current_company.test_sets.create(test_set_params)

    redirect_to admin_test_sets_path
  end

  def show
    @test_set = current_company.test_sets.find(params[:id])
  end
  
  def update
    @test_set = current_company.test_sets.find(params[:id])
    @test_set.update(test_set_params)

    redirect_to admin_test_set_path(@test_set)
  end

private

  def test_set_params
    params.require(:test_set).permit(:title, :description, :public)
  end
end
