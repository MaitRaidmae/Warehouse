class ProductsController < ApplicationController

	def index
	  @products = Product.all
	end

	def show
	  @product = Product.find(params[:id])
	end

	def new
	  @product = Product.new

	  @all_categories = Category.all

	end

	def edit
	  @product = Product.find(params[:id])
	  @all_categories = Category.all


	end

	def create
	  @product = Product.new(product_params)

    if params[:categories][:id]
      params[:categories][:id]= params[:categories][:id].reject(&:empty?).map(&:to_i)

      params[:categories][:id].each do |cat|
        @product.categories_products.build(:category_id => cat)
      end
    end

 	  if @product.save
   	  redirect_to products_path
   	else
   	  render 'new'
   	end
	end

	def update
	  @product = Product.find(params[:id])

	  if @product.update(product_params)
	    redirect_to @product
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @product = Product.find(params[:id])
	  @product.destroy

	  redirect_to products_path
	end

	private
	  def product_params
	    params.require(:product).permit(:name, :description,:picture, :categories => [:id, :name])
	  end

end
