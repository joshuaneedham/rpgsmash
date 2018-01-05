class UniverseUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :universe_users do |uu|
  		uu.integer :user_id
  		uu.integer :universe_id
  	end
  end
end
