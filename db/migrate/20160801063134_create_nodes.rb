class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.references :user, foreign_key: true
      t.string :identifier
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
