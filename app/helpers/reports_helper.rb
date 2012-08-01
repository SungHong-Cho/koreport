module ReportsHelper
  def current_user_buy_this?(item)
    @purchases = current_user.purchases
    @purchases.each do |purchase|
    end
  end
end
