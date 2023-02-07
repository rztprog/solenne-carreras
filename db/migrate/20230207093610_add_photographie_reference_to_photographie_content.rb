class AddPhotographieReferenceToPhotographieContent < ActiveRecord::Migration[7.0]
  def change
    add_reference :photographie_contents, :photographie, foreign_key: true
  end
end
