class RemoveLanguageFromTracks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tracks, :language, :string
  end
end
