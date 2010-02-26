class CreateSynonyms < ActiveRecord::Migration
  def self.up
    create_table :synonyms do |t|
      t.string :str
      t.integer :word_id

      t.timestamps
    end
  end

  def self.down
    drop_table :synonyms
  end
end
