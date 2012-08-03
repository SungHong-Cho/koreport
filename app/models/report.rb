# -*- coding: utf-8 -*-
class Report < ActiveRecord::Base
  attr_accessible :college_list, :content, :dep_list, :hit, :intro, :list, :page, :price, :title, :univ_list, :expert_rate, :year, :documents_attributes, :docs

  acts_as_taggable
  acts_as_taggable_on :univs, :colleges, :deps
  
  has_and_belongs_to_many :packages
  belongs_to :user
  has_many :buckets, :as => :bucket_item
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
    when 1
      3800
    when 2
      2800
    when 3
      1800
    else
      3800
    end
  end

  def purchase(user)
    self.purchases.where(user_id: user.id).first
  end

  def univ_name
    @univs = ["강원대학교", "건국대학교", "경북대학교", "경희대학교", "고려대학교", "광운대학교", "국민대학교", "단국대학교", "동국대학교", "부산대학교", "서강대학교", "세종대학교", "숭실대학교", "서울대학교", "아주대학교", "연세대학교", "인하대학교", "전남대학교", "전북대학교", "중앙대학교", "충남대학교", "충북대학교", "한동대학교", "홍익대학교", "경인교육대학교", "서울교육대학교", "서울여자대학교", "성균관대학교", "숙명여자대학교", "유니스트", "이화여자대학교", "카이스트", "포항공과대학교", "한국외국어대학교", "한국교원대학교", "한양대학교", "서울시립대학교", "가톨릭대학교"]

    self.univs.each do |univ|
      return univ.name if @univs.include?(univ.name)
    end
    return "package"
  end
    
end
