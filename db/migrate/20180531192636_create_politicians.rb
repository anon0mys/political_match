class CreatePoliticians < ActiveRecord::Migration[5.2]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :role
      t.string :gender
      t.string :party
      t.string :twitter_id
      t.string :facebook_account
      t.string :next_election

      t.timestamps
    end
  end
end
