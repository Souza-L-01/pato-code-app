class AddColumnsExplanationToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :columns_explanation, :string
  end
end
