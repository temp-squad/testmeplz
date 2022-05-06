class Admin::TestSetItemsController < Admin::BaseController
  def create
    @test_set = current_company.test_sets.find(params[:test_set_id])
    @test_set.items.create!(test_set_item_params)
    
    redirect_to admin_test_set_path(@test_set)
  end
  
  def update
    @test_set = current_company.test_sets.find(params[:test_set_id])
    @test_set_item = @test_set.items.find(params[:id])
    @test_set_item.update!(test_set_item_params)

    redirect_to admin_test_set_path(@test_set)
  end

private

  def test_set_item_params
    params.require(:test_set_item).permit(:test_id)
  end
end
