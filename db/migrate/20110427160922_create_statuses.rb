class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.text :message
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
