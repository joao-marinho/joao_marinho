class Group < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true


end
