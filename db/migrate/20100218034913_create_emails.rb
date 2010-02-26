class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :subject
      t.string :body
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
