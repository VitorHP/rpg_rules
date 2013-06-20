class Book < ActiveRecord::Base
  attr_accessible :name

  belongs_to :system
  has_many :rules
end
