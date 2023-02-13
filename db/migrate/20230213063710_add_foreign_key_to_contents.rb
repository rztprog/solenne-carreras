class AddForeignKeyToContents < ActiveRecord::Migration[7.0]
  def change
    add_reference :contents, :photographie, foreign_key: true
  end
end
