class CreateGraphismes < ActiveRecord::Migration[7.0]
  def change
    create_table :graphismes do |t|

      t.timestamps
    end
  end
end
