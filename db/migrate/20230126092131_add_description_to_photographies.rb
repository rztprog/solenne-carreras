class AddDescriptionToPhotographies < ActiveRecord::Migration[7.0]
  def change
    add_column :photographies, :description, :string
  end
end
