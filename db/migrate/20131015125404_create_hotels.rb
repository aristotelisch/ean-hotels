class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :description
      t.string :stars

      t.timestamps
    end
  end
end
