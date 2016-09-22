class Api::ProductsController < ApplicationController
  private

  def collection
    @collection ||= Product.page(params[:page]).per(5)
  end
end
