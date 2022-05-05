class Test < ApplicationRecord
  RETURN_TYPES = ["text", "number", "object", "array"]

  has_many :test_cases, dependent: :destroy
  has_many :test_answers, dependent: :destroy
  has_many :test_languages, dependent: :destroy

  has_one :company_test, dependent: :destroy

  default_scope -> { order(:created_at) }

  def available_languages
    test_languages.pluck(:language).map{ |lang| [lang.capitalize, lang] }
  end
end
