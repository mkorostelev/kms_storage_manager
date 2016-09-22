class ProductDecorator < Draper::Decorator
  delegate_all
  decorates_association :author

  def as_json *args
    super only: [:id, :title]
  end
end
