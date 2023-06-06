class CreateHints < ActiveRecord::Migration[7.0]
  def change
    create_table :hints do |t|
      t.string :content
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
