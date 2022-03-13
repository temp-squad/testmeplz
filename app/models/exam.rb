class Exam < ApplicationRecord
  has_many :test_answers, dependent: :destroy
  has_many :tests, through: :test_answers
  after_create do
    Test.all.each do |test|
      test_answers.create(test: test)
    end
  end

  def submitted?
    finished_at.present?
  end

  def total_tests
    tests.count
  end

  def test_index(test)
    tests.pluck(:id).find_index(test.id)
  end

  def test_position(test)
    test_index(test) + 1
  end

  def current_test_index(test)
    test_index(test)
  end

  def prev_test(current_test)
    current_index = test_index(current_test)
    prev_index = current_index - 1
    
    prev_index < 0 ? nil : tests.pluck(:id)[prev_index]
  end

  def next_test(current_test)
    current_index = test_index(current_test)
    tests.pluck(:id)[current_index + 1]
  end

  def last_test(test)
    test_position(test) == total_tests
  end
end
