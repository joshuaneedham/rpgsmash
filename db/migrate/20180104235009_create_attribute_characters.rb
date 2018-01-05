class CreateAttributeCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_characters do |t|

      t.timestamps
    end
  end
end
