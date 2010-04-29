class CreateRedPeople < ActiveRecord::Migration
  def self.up
    create_table :red_people do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :red_people
  end
end
