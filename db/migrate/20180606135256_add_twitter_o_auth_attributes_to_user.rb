class AddTwitterOAuthAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :twitter_id, :string
    add_column :users, :twitter_token, :string
    add_column :users, :twitter_secret, :string
  end
end
