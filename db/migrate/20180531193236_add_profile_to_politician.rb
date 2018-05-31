class AddProfileToPolitician < ActiveRecord::Migration[5.2]
  def change
    add_column :politicians, :profile, :string
  end
end
