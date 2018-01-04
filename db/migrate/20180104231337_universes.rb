class Universes < ActiveRecord::Migration[5.1]
  def change
  	create_table :universes do |u|
  		u.string :title
  		u.string :description
  	end
  end
end
