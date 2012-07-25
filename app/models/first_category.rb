class FirstCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :second_categories
end
