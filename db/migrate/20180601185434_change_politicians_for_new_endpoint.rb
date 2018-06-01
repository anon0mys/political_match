class ChangePoliticiansForNewEndpoint < ActiveRecord::Migration[5.2]
  def change
    drop_table :politicians
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :party
      t.string :twitter_account
      t.string :state
      t.integer :govtrack_id

      t.timestamps
    end
  end
end
