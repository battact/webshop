class CreateJoinTableBetweenCategoriesAndProducts < ActiveRecord::Migration
  def change
    create_join_table :products, :categories, table_name: :categorizations do |t|
      t.index :product_id
      t.index :category_id
    end
  end
end
