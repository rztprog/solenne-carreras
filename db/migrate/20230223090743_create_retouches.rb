class CreateRetouches < ActiveRecord::Migration[7.0]
  def change
    create_table :retouches do |t|

      t.timestamps
    end
  end
end
