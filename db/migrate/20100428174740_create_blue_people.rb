class CreateBluePeople < ActiveRecord::Migration
  def self.up
    create_table :blue_people do |t|
      t.string :name
      t.string :rank
      t.integer :serial_number

      t.timestamps
    end
  end

  def self.down
    drop_table :blue_people
  end
end
