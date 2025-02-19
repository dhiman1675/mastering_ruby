class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category
      t.string :url
      t.datetime :last_scraped_at

      t.timestamps
    end
  end
end
