class FixPostTitleColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :titlet, :title
  end
end
