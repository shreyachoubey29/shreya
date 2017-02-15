class CreatePageCategories < ActiveRecord::Migration
  def change
    create_table :page_categories do |t|
      t.integer :page_id
      t.integer :category_id
    end
  end
end
