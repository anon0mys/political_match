class RenameTypeInProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :type, :political_type
  end
end
