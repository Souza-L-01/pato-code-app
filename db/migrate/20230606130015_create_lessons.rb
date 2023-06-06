class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :track, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.integer :difficulty

      t.timestamps
    end
  end
end
