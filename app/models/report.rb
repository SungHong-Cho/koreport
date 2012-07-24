class Report < ActiveRecord::Base
  attr_accessible :college, :content, :dep, :hit, :intro, :list, :page, :price, :rate, :title, :univ, :user_id, :year

  has_and_belongs_to_many :packages
end
