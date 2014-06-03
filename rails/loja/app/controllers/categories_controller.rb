class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @msg = "Ola Mundo"
  end

  def edit

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_param)
    @category.save
    redirect_to @category
  end

  def update
    @category.update(category_param)
    redirect_to @category
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_param
    params.require(:category).permit(:title, :description)
  end

end
