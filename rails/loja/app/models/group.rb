class Group < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :users, dependent: :destroy
end
