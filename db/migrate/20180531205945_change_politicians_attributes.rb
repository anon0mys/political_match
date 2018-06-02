class ChangePoliticiansAttributes < ActiveRecord::Migration[5.2]
  def change
    drop_table :politicians
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :gender
      t.string :party
      t.string :twitter_account
      t.string :facebook_account
      t.string :next_election
      t.string :state
      t.string :district
      t.integer :votes_with_party_pct

      t.timestamps
    end
  end
end
