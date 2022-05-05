module HasCompanyMember
  def self.included(base)
    base.has_one :company_member, dependent: :destroy
    base.has_one :company, through: :company_member
  end

  def is_company_member?
    company.present?
  end
end
