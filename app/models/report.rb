class Report < ActiveRecord::Base
  attr_accessible :college, :content, :dep, :hit, :intro, :list, :page, :price, :rate, :title, :univ, :user_id, :year, :document1, :document2, :document3, :document4, :document5

  has_and_belongs_to_many :packages
  belongs_to :user

  has_attached_file :document1
  has_attached_file :document2
  has_attached_file :document3
  has_attached_file :document4
  has_attached_file :document5

  validates :price, :page, :title, :presence => true
end
