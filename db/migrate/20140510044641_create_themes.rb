class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.integer :woman_id
      t.integer :theme_kbn

      t.timestamps
    end
  end
end
