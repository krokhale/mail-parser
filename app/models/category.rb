class Category < ActiveRecord::Base
  has_many :words
  has_many :emails
  belongs_to :master
end
