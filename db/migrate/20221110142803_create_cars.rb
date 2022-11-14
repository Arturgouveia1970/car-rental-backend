class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year
      t.string :image
      t.decimal :price

      t.timestamps
    end
  end
end
