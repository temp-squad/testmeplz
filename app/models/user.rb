class User < ApplicationRecord
  # IsCompanyMember is a module to manage methods related with a company
  include HasCompanyMember

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exams
end
