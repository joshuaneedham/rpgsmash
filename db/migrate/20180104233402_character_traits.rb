class CharacterTraits < ActiveRecord::Migration[5.1]
  def change
  	create_table :character_traits do |ct|
  		ct.integer :character_id
  		ct.integer :trait_id
  	end
  end
end
