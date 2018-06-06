class UpdateProfileAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :type, :integer
    add_column :profiles, :preferred_party, :string
    add_column :profiles, :authority_rating, :integer
    add_column :profiles, :social_rating, :integer
  end
end
