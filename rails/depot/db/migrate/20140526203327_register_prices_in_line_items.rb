class RegisterPricesInLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |line|
      line.price = line.product.price
      line.save!
    end
  end

  def down
    LineItem.all.each do |line|
      line.price = nil
      line.save!
    end
  end
end
