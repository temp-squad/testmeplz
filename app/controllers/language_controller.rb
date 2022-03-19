class LanguageController < ApplicationController
  def update
    @answer = TestAnswer.find(params[:answer_id])
    @answer.update(test_answer_params)

    head :ok
  end

private

  def test_answer_params
    params.require(:test_answer).permit(:language)
  end
end
