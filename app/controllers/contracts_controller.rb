class ContractsController < ApplicationController
  def index
    @contract = Contract.all
  end

  def show
    @contract = contract.find(params[:id])
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      @name = @contract.name.to_s
      redirect_to insurance_product_contract_index_path
    else
      render :new
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def update
    @contract = Contract.find(params[:id])
    @contract.update(contract_params)
    redirect_to contract_path(@contract)
  end

  def destroy
    @contract = Contract.find(params[:id])
    @coontract.destroy
    redirect_to insurance_product_contract_index_path, status: :see_other
  end

  private

  def contract_params
    params.require(:contract).permit(:price, :source, :start_at, :ends_at, :status, :created_at, :updated_at)
  end
end
