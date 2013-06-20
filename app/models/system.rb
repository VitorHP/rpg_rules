class System < ActiveRecord::Base
  attr_accessible :name

  has_many :books
  has_many :rules, through: :books
end
