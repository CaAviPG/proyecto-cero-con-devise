class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :title
      t.string :category
      t.integer :precio
      t.text :description

      t.timestamps
    end
  end
end
