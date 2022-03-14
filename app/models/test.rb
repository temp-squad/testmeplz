class Test < ApplicationRecord
  has_many :test_cases, dependent: :destroy
  has_many :test_answers, dependent: :destroy
  has_many :test_languages, dependent: :destroy

  default_scope -> { order(:created_at) } 
end
