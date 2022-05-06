module HasTest
  def self.included(base)
    base.has_many :company_tests, dependent: :destroy
    base.has_many :tests, through: :company_tests, dependent: :destroy
    base.has_many :test_sets, dependent: :destroy
  end
end
