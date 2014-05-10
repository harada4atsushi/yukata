class CreateWomen < ActiveRecord::Migration
  def change
    create_table :women do |t|
      t.string :name
      t.string :area
      t.boolean :published

      t.timestamps
    end
  end
end
