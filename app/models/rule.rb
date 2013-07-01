class Rule < ActiveRecord::Base
  attr_accessible :book_id, :description, :name, :page

  belongs_to :book
end
