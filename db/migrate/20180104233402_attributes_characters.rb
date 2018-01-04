class AttributesCharacters < ActiveRecord::Migration[5.1]
  def change
  	create_table :attributes_characters do |ac|
  		ac.integer :character_id
  		ac.integer :attribute_id
  	end
  end
end
