class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contract = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      @name = @contract.name.to_s
      redirect_to contract_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contract.update(contract_params)
      redirect_to contract_path, notice: "Contract was updated"
    else
      render :edit
    end
  end

  def destroy
    @contract.destroy
    redirect_to contract_path, status: :see_other
  end

  private

  def contract_params
    params.require(:contract).permit(:price, :source, :starts_at, :ends_at, :status, :created_at, :updated_at, :pdf_contract, :pdf_certificate)
  end

  def set_contract
    @contract = Contract.find(params[:id])
  end
end
