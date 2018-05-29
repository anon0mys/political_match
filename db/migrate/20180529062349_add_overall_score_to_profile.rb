class AddOverallScoreToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :overall, :string
  end
end
