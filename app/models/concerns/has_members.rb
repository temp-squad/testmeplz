module HasMembers
  def self.included(base)
    base.has_many :company_members, dependent: :destroy
    base.has_many :members, through: :company_members, source: "user"
  end
end
