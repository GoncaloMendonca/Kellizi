class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @contracts = Contract.search_by_company_and_product(params[:query])
    else
      @contracts = Contract.all
    end
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user

    if @contract.save
      redirect_to contracts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update(contract_params)
      redirect_to contracts_path, notice: "Contract was updated"
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path, status: :see_other
  end

  private

  def contract_params
    params.require(:contract).permit(
      :price, :source, :starts_at, :ends_at, :status, :created_at,
      :updated_at, :pdf_contract, :pdf_certificate,
      :company_id, :product_id, :active
    )
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
