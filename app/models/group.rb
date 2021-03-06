class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :group_name, uniqueness: true, presence: true
end
