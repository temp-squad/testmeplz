class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    @answer = TestAnswer.find(params[:id])
    @answer.update(test_answer_params)

    p @answer.errors.full_messages
  end

private

  def test_answer_params
    params.require(:test_answer).permit(:answer)
  end
end
