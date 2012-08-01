class Report < ActiveRecord::Base
  attr_accessible :college_list, :content, :dep_list, :hit, :intro, :list, :page, :price, :title, :univ_list, :expert_rate, :year, :documents_attributes, :document

  acts_as_taggable
  acts_as_taggable_on :univs, :colleges, :deps
  
  has_and_belongs_to_many :packages
  belongs_to :user
  has_many :buckets
  has_many :purchases, :as => :item

  has_many :documents

  validates :price, :page, :title, :presence => true
    
  accepts_nested_attributes_for :documents, :allow_destroy => true

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
