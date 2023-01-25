class AddNameAndPhotoToPhotographies < ActiveRecord::Migration[7.0]
  def change
    add_column :photographies, :name, :string
  end
end
