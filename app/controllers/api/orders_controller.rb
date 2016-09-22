class Api::OrdersController < ApplicationController
  def create
    available_quantity = StorageItem.where(
                      product_id: resource_params[:product_id]).sum(:quantity)
    if available_quantity < resource_params[:quantity].to_i
      head :precondition_failed
      return
    end
    super
  end

  private

  def build_resource
    @order = Order.new resource_params
  end

  def resource
    @order ||= Order.find(params[:id])
  end

  def resource_params
    params.require(:order).permit(:product_id, :quantity, :status)
  end

  def collection
    @collection ||= Order.page(params[:page]).per(5)
  end
end
