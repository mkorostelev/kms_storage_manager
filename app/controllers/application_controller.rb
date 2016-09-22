class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :resource, :collection

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = exception

    render :exception
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end

  def create
    build_resource

    resource.save!
  end

  def update
    resource.update! resource_params
  end

  private

  def json_request?
    request.format.json?
  end
end
