class CategoriesController < ApplicationController

	def index
	  @categories = Category.all
	end

	def show
	  @category = Category.find(params[:id])
	end

	def new
	  @category = Category.new
	end

	def edit
	  @category = Category.find(params[:id])
	end

	def create
	  @category = Category.new(product_params)

 	  if @category.save
   	  redirect_to products_path
   	else
   	  render 'new'
   	end
	end

	def update
	  @category = Category.find(params[:id])

	  if @category.update(product_params)
	    redirect_to @category
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @category = Category.find(params[:id])
	  @category.destroy

	  redirect_to categories_path
	end

	private
	  def product_params
	    params.require(:category).permit(:name, :description)
	  end

end
