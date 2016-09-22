class DeclinedEmailJob < ApplicationJob
  queue_as :default

  def perform(item)
    WarehouseMailer.declined_email(item).deliver_later
  end
end
