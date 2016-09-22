class WarehouseDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :email]
  end
end
