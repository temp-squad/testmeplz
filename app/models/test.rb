class Test < ApplicationRecord
  has_many :test_cases, dependent: :destroy
  has_many :test_answers, dependent: :destroy
  has_many :test_languages, dependent: :destroy

  default_scope -> { order(:created_at) }

  def available_languages
    test_languages.pluck(:language).map{ |lang| [lang.capitalize, lang] }
  end
end
