class CreatePs451as < ActiveRecord::Migration
  def self.up
    create_table :ps451as do |t|
      t.string :regioncode
      t.string :loccode
      t.string :locdesc
      t.integer :invcnt
      t.integer :qty
      t.integer :orgamt
      t.integer :netamt

      t.timestamps
    end
  end

  def self.down
    drop_table :ps451as
  end
end
