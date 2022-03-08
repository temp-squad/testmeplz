class Exam < ApplicationRecord
  has_many :test_answers, dependent: :destroy
  has_many :tests, through: :test_answers
  after_create do
    Test.all.each do |test|
      test_answers.create(test: test)
    end
  end
end
