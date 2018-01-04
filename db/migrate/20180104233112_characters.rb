class Characters < ActiveRecord::Migration[5.1]
  def change
  	create_table :characters do |c|
  		c.string :name
  		c.string :biography
  		c.integer :universe_id
  	end
  end
end
