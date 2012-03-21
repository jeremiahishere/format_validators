class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :name
      t.string :county

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
