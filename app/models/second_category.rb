class SecondCategory < ActiveRecord::Base
  attr_accessible :first_category_id, :name

  belongs_to :first_category

  validates :name, :presence => true
end
