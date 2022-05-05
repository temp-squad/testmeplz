class Admin::TestsController < Admin::BaseController
  def index
    @tests = current_company.tests
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    ActiveRecord::Base.transaction do
      @test = Test.create!(test_params)
      current_company.tests << @test
      current_company.save
    end

    redirect_to admin_tests_path
  end

private
  
  def test_params
    params.require(:test).permit(:title, :description, :return_type)
  end
end
