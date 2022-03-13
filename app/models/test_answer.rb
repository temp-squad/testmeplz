class TestAnswer < ApplicationRecord
  belongs_to :exam
  belongs_to :test

  validate do
    errors.add(:base, message: "Exam has already been submitted!")
  end
end
