class ItemDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :warehouse_id, :order_id, :quantity]
  end
end
