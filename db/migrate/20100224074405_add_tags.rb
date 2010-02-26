class AddTags < ActiveRecord::Migration
    def self.up
      add_column :emails, :tags, :string
    end

    def self.down
      remove_column :emails, :tags
    end
  end
