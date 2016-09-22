class Api::StorageItemsController < ApplicationController
  private

  def parent
    @parent ||= Warehouse.find(params[:warehouse_id])
  end

  def resource_params
    params.require(:storage_item).permit(:quantity)
  end

  def collection
    @collection ||= parent.storage_items.where(quantity: resource_params[:quantity]).page(params[:page]).per(5)
  end
end
