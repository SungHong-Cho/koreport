class Question < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  has_many :answers
  belongs_to :user

  validates :content, :title, :presence => true
end
