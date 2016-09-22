class StorageItemDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    super only: [:id, :warehouse_id, :quantity],
          methods: [:product]
  end
end
