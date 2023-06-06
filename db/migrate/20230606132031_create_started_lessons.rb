class CreateStartedLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :started_lessons do |t|
      t.boolean :status
      t.references :lesson, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
