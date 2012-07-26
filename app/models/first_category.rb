class FirstCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :second_categories

  validates :name, :presence => true
end
