class AddNameToGraphismes < ActiveRecord::Migration[7.0]
  def change
    add_column :graphismes, :name, :string
  end
end
