class OrderDecorator < Draper::Decorator
  delegate_all
  decorates_association :items

  def as_json *args
    super only: [:id, :product_id, :quantity, :status],
          methods: [:items]
  end
end
