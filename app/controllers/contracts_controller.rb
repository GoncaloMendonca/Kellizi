class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present? && params[:query].present?
      @contracts = policy_scope(Contract).joins(
        "INNER JOIN products ON products.id = contracts.product_id
        JOIN categories ON categories.id = products.category_id
        AND categories.name = '#{params[:category]}'"
      ).search_by_company_and_product(params[:query])
    elsif params[:category].present?
      # @contracts = policy_scope(Contract).search_by_company_and_product(params[:query])
      @contracts = policy_scope(Contract).joins(
        "INNER JOIN products ON products.id = contracts.product_id
        JOIN categories ON categories.id = products.category_id
        AND categories.name = '#{params[:category]}'"
      )
    else
      @contracts = policy_scope(Contract)
    end
  end

  def show
    authorize @contract
  end

  def new
    @contract = Contract.new
    authorize @contract
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user

    authorize @contract

    if @contract.save
      redirect_to contracts_path(category: @contract.product.category.name)
    else
      render :new
    end
  end

  def edit
    authorize @contract
  end

  def update
   @contract = Contract.find_by(id: params[:id])
    if @contract.update(contract_params)
      redirect_to contract_path(@contract.id), notice: "Contract was updated"
    else
      render :edit
    end
   authorize @contract
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path, status: :see_other

    authorize @contract
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
