class ExamService
  def self.create(user:, tests:)
    exam = user.exams.create

    tests.each do |test|
      test_language = test.test_languages.first || test.test_languages.create(language: "ruby")
      exam.test_answers.create(test: test, answer: test_language&.placeholder, language: test_language&.language)
    end

    return exam
  end
end
