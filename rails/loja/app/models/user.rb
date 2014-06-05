class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :group
  has_secure_password
end
