class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :payer_name, :account, :bank, :tel
  # attr_accessible :title, :body

  has_one :seller
  has_many :purchases
  #has_many :purchase_reports, :as => :item, :source => :report
  #has_many :purchase_packages, :as => :item, :source => :package
  has_many :buckets
  has_many :bucket_reports, :through => :buckets, :source => :report
  has_many :bucket_packages, :through => :buckets, :source => :package
  has_many :reports
  has_many :questions
  has_many :feedbacks

  validates :email, :password, :presence => true
  validates :password, :confirmation => true

  def buy_this?(report)
    @purchases = self.purchases.where(item_type: "Report", item_id: report.id)
    @purchase = @purchase.first if @purchases
    @purchase.isPaid
  end
end
