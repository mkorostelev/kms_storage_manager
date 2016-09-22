class WarehouseMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def accepted_email(item)
    @item = item
    @url = 'http://example.com/login'
    mail(to: @item.warehouse.email, subject: "Order №#{@item.order.id} was accepted")
  end

  def declined_email(item)
    @item = item
    @url = 'http://example.com/login'
    mail(to: @item.warehouse.email, subject: "Order №#{@item.order.id} was declined")
  end
end
