class Attributes < ActiveRecord::Migration[5.1]
  def change
  	create_table :attributes do |a|
  		a.string :name
  		a.string :description
  		a.string :datatype
  		a.integer :universe_id
  	end
  end
end
