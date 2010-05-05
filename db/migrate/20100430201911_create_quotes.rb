class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :name
      t.string :student_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
