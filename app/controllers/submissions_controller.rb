class SubmissionsController < ApplicationController
  def create
    @test_answer = TestAnswer.find(params[:test_answer_id])
    @test = @test_answer.test
    @test_cases = @test.test_cases
    
    sanitize_answer = params[:answer].gsub(/(?:\n\r?|\r\n?)/, '; ')

    test_class = Class.new
    test_class.class_eval(sanitize_answer)
    test_class_instance = test_class.new
    
    # For demo, check only one
    @test_case = @test_cases.first
    
    @test_cases.each_with_index do |test_case, index|
      p "Test Case ##{index + 1}"
      p "input: #{test_case.input}"
      p "expected return: #{test_case.expected_return}"

      input = test_case.input.split(",").map(&:to_i)
      actual_return = test_class_instance.execute(*input)
      
      @result = test_case.expected_return.to_i == actual_return ? "passed" : "failed"
      p "actual return: #{actual_return}"
      p "result: " + @result
    end
  end
end
