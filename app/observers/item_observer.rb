class ItemObserver < ActiveRecord::Observer
  def after_commit(item)
    return unless item.is_a?(Item)

    storage_item = StorageItem.find_by(warehouse: item.warehouse,
                        product_id: item.order.product_id)
    if item.order.accepted?
      storage_item.decrement(:quantity, item.quantity)

      AcceptedEmailJob.set(wait_until: DateTime.current + 5.seconds)
                    .perform_later(item)
    else
      storage_item.increment(:quantity, item.quantity)
      DeclinedEmailJob.set(wait_until: DateTime.current + 5.seconds)
                    .perform_later(item)
    end
    storage_item.save
  end
end
