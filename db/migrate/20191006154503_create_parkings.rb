class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :plate, :null => false
      t.string :time, :null => true
      t.datetime :entry_at, :null => false
      t.datetime :exit_at, :null => true
      t.boolean :paid, :null => true
      t.boolean :left, :null => true

      t.timestamps
    end
  end
end
