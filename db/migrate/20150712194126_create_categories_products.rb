class CreateCategoriesProducts < ActiveRecord::Migration
  def change

     create_table :categories_products, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true
     end

  end
end
