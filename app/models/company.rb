class Company < ApplicationRecord
  include HasMembers
  include HasTest
end
