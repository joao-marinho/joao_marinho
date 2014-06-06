class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  has_and_belongs_to_many :products

end
