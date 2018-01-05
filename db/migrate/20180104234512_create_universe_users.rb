class CreateUniverseUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :universe_users do |t|

      t.timestamps
    end
  end
end
