class CreateSnaps < ActiveRecord::Migration
  def self.up
    create_table :snaps do |t|
      t.text :body
      t.string :url
      t.references :user

      t.timestamps
    end

    add_index :snaps, :url
  end

  def self.down
    drop_table :snaps
  end
end
