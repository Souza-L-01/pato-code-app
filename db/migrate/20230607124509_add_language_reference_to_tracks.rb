class AddLanguageReferenceToTracks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tracks, :language, null: false, foreign_key: true
  end
end
