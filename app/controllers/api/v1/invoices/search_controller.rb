class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: Invoice.find_by(search_params)
  end

  private
  def search_params
    params.permit(:id, :status, :created_at, :updated_at)
  end
end
