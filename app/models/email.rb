class Email < ActiveRecord::Base
  has_one :attachment
  belongs_to :categories
  

  
end
