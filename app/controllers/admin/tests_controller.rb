class Admin::TestsController < Admin::BaseController
  def index
    @tests = current_company.tests
  end

  def show
    @test = current_company.tests.find(params[:id])
  end

  def new
    @test = current_company.tests.new
  end

  def create
    ActiveRecord::Base.transaction do
      @test = current_company.tests.create!(test_params)
      current_company.tests << @test
      current_company.save
    end

    redirect_to admin_tests_path
  end

  def update
    @test = current_company.tests.find(params[:id])
    @test.update(test_params)

    redirect_to admin_test_path(@test)
  end

private
  
  def test_params
    params.require(:test).permit(:title, :description, :return_type)
  end
end
