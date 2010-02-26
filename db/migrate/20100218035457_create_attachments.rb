class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.binary :content
      t.string :name
      t.integer :email_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
