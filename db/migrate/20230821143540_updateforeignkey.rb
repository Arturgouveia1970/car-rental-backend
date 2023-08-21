class Updateforeignkey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cars, :users, on_delete: :cascade
  end
end
