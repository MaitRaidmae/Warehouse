class Category < ActiveRecord::Base

 validates :name, :presence => true

 has_many :categories_products
 has_many :products, :through => :categories_products

end
