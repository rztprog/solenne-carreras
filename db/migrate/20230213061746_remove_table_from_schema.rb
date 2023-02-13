class RemoveTableFromSchema < ActiveRecord::Migration[7.0]
  def change
    drop_table :photographie_contents
    drop_table :contents
  end
end
