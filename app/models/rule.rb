class Rule < ActiveRecord::Base
  attr_accessible :book_id, :description, :name, :system_id

  belongs_to :book
end
