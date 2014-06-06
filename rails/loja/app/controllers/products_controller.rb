class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :update]

  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_param)
    @product.save
    redirect_to @product
  end

  def edit

  end

  def update
    if @product.update(product_param)
      add_categories_from_params
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def product_param
    params.require(:product).permit(:title, :description, :image_url, :price)
  end

  def add_categories_from_params
    categories_ids = extract_categories_ids_from_params
    return if categories_ids.nil?

    categories_ids.reject!{|id| Category.select(:id).where(id: id).empty? }

    new_categories_ids = categories_ids.reject{ |id| @product.categories.select(:id).where(id: id).any? }
    puts 'lol', categories_ids
    @product.categories << Category.find(new_categories_ids)
    @product.categories.each do |category|
      puts categories_ids
      puts category.id
      puts categories_ids.include?(category.id)
      puts category
      unless categories_ids.include?(category.id)
        category.products.delete(@product)
      end
    end
  end

  def extract_categories_ids_from_params
    params["categories_selected"].map{|id| id.to_i}
  end


end
