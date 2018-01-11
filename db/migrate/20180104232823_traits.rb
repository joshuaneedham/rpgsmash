class Traits < ActiveRecord::Migration[5.1]
  def change
  	create_table :traits do |t|
  		t.string :name
  		t.string :description
  		t.string :datatype
  		t.integer :universe_id
  	end
  end
end
