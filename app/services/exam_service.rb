class ExamService
  def self.create(full_name:)
    user = User.find_or_create_by(full_name: full_name)
    exam = user.exams.create

    Test.all.each do |test|
      test_language = test.test_languages.first
      exam.test_answers.create(test: test, answer: test_language.placeholder, language: test_language.language)
    end

    return exam
  end
end
