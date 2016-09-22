class Api::WarehousesController < ApplicationController
  private

  def collection
    @collection ||= Warehouse.page(params[:page]).per(5)
  end
end
