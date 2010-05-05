class CreateNames < ActiveRecord::Migration
  def self.up
    create_table :names do |t|
      t.string :name
      t.string :studentid

      t.timestamps
    end
  end

  def self.down
    drop_table :names
  end
end