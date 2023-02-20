class AddForeignKeyToElements < ActiveRecord::Migration[7.0]
  def change
    add_reference :elements, :graphisme, foreign_key: true
  end
end
