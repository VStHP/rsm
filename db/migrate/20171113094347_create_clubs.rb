class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true, null: false
      t.string :position, null: false
      t.date :start_time
      t.date :end_time
      t.text :content
      t.boolean :current, default: false
      t.timestamps
    end
    add_index :clubs, :name
  end
end
