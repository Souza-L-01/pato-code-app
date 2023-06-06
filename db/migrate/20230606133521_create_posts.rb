class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :titlet
      t.string :content
      t.timestamp :timestamp
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
