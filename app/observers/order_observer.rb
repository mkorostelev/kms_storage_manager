class OrderObserver < ActiveRecord::Observer
  def before_save(order)
    return unless order.is_a?(Order)
    if order.accepted? && order.id.nil?
      quantity_left = order.quantity
      StorageItem.where(product_id: order.product_id).each do |storage_item|
        quantity_curr = [quantity_left, storage_item.quantity].min
        order.items.build(
          warehouse_id: storage_item.warehouse_id,
          quantity: quantity_curr)
        quantity_left -= quantity_curr

        return if quantity_left == 0
      end
    elsif order.status != Order.find(order.id).status
      order.items.each do |item|
        item.committed!
      end
    end
  end
end
