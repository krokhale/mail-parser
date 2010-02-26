class AddMasterId < ActiveRecord::Migration
    def self.up
      add_column :categories, :master_id, :integer
    end

    def self.down
      remove_column :categories, :master_id
    end
  end
