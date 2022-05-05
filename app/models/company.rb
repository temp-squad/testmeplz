class Company < ApplicationRecord
  has_many :members, dependent: :destroy, class_name: "CompanyMember"
end
