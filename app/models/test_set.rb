class TestSet < ApplicationRecord
  has_many :items, dependent: :destroy, class_name: "TestSetItem"
  has_many :tests, through: :items
  belongs_to :company
end
