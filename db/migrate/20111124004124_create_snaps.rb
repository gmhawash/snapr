class CreateSnaps < ActiveRecord::Migration
  def self.up
    create_table :snaps do |t|
      t.text :html

      t.timestamps
    end
  end

  def self.down
    drop_table :snaps
  end
end
