class AddExternalUrlToTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :tracks, :external_url, :string
  end
end
