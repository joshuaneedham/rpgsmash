class UniversesUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :universes_users do |uu|
  		uu.integer :user_id
  		uu.integer :universe_id
  	end
  end
end
