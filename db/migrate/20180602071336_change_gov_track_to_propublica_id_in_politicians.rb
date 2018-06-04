class ChangeGovTrackToPropublicaIdInPoliticians < ActiveRecord::Migration[5.2]
  def change
    rename_column :politicians, :govtrack_id, :propublica_id
  end
end
