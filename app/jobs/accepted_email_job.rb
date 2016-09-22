class AcceptedEmailJob < ApplicationJob
  queue_as :default

  def perform(item)
    WarehouseMailer.accepted_email(item).deliver_later
  end
end
