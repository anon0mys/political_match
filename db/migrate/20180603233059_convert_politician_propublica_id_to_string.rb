class ConvertPoliticianPropublicaIdToString < ActiveRecord::Migration[5.2]
  def change
    change_column :politicians, :propublica_id, :string
  end
end
