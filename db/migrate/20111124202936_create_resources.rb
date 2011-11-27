class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.datetime :data_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
