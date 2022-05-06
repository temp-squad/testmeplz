class Company < ApplicationRecord
  include HasMembers
  include HasTest

  has_many :candidates, dependent: :destroy
end
