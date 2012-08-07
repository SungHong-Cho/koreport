module BucketsHelper
  def item_price_sum(items)
    @items = items
    @total_price = 0

    @items.each do |item|
      @total_price += item.grade_price
    end

    @total_price
  end
end
