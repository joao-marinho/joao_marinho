class StoreController < ApplicationController

  def index
    set_products
    @categories = Category.all
  end

  private
  def set_products
    if exists_category_id? && category_id_valid?
      @products = products_from_category_id
    else
      @products = Product.all
    end
  end

  def exists_category_id?
    params[:categoy_id].nil?
  end

  def category_id_valid?
    Category.where(id: params[:category_id]).any?
  end

  def products_from_category_id
    Category.find(params[:category_id]).products
  end

end
