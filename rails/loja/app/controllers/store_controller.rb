class StoreController < ApplicationController
  skip_before_action :authorize
  def index
    set_products
  end

  private
  def set_products
    if exists_category_id? && category_id_valid?
      @products = products_from_category_id
      @category_title = Category.find(params[:category_id]).title
    else
      @products = Product.all
      @category_title = "All Products"
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
