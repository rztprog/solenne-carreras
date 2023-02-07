class CreatePhotographieContents < ActiveRecord::Migration[7.0]
  def change
    create_table :photographie_contents do |t|

      t.timestamps
    end
  end
end
