class Report < ActiveRecord::Base
  attr_accessible :college, :content, :dep, :hit, :intro, :list, :page, :price, :rate, :title, :univ, :user_id, :year, :documents_attributes, :document

  has_and_belongs_to_many :packages
  belongs_to :user
  has_many :buckets
  has_many :purchases, :as => :item

  has_many :documents

  validates :price, :page, :title, :presence => true
    
  accepts_nested_attributes_for :documents, :allow_destroy => true
end
