class CompaniesController < ApplicationController
  def index
  end

  def show
    @company = company.find(params[:id])
  end

  private

  def company_params
  end
end
