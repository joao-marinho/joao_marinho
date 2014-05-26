class Cart < ActiveRecord::Base
  has_many :line_itens, dependent: :destroy
end
