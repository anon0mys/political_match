class ChangeUserReferenceToOwnerInProfiles < ActiveRecord::Migration[5.2]
  def change
    drop_table :profiles
    create_table :profiles do |t|
      t.string :overall
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
