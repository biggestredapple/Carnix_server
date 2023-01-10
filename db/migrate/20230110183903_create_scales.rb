class CreateScales < ActiveRecord::Migration[7.0]
  def change
    create_table :scales do |t|
      t.datetime :date
      t.string :product_id
      t.decimal :weight
      t.string :unit
      t.string :category

      t.timestamps
    end
  end
end
