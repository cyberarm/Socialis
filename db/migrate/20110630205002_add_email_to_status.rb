class AddEmailToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :email, :string
  end

  def self.down
    remove_column :statuses, :email
  end
end
