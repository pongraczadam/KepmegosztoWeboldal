class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :name
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
