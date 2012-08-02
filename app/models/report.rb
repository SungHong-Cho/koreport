# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  attr_accessible :college_list, :content, :dep_list, :hit, :intro, :list, :page, :price, :title, :univ_list, :expert_rate, :year, :documents_attributes, :docs

  acts_as_taggable
  acts_as_taggable_on :univs, :colleges, :deps
  
  has_and_belongs_to_many :packages
  belongs_to :user
  has_many :buckets
  has_many :purchases, :as => :item

  has_many :documents

  validates :page, :title, :presence => true
    
  accepts_nested_attributes_for :documents, :allow_destroy => true

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def grade_price
    case self.expert_rate
    when 1, 4, 5, 7
      3800
    when 2
      2800
    when 3
      1800
    end
  end

  def purchase(user)
    self.purchases.where(user_id: user.id).first
  end
    
end
