class Product < ActiveRecord::Base
 has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
# validates :name, :presence => true

 has_many :categories_products
 has_many :categories, :through => :categories_products

end
