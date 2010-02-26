class Word < ActiveRecord::Base
  belongs_to :category
  has_many :synonyms
end
