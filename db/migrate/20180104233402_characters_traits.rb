class CharactersTraits < ActiveRecord::Migration[5.1]
  def change
  	create_table :characters_traits do |ct|
  		ct.integer :character_id
  		ct.integer :attribute_id
  	end
  end
end
