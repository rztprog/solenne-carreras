class CreatePhotographies < ActiveRecord::Migration[7.0]
  def change
    create_table :photographies do |t|

      t.timestamps
    end
  end
end
