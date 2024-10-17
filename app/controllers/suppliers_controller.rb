class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update]
  def index
    @suppliers = Supplier.all
  end

  def show; end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      return redirect_to @supplier, notice: 'Fornecedor cadastrado com sucesso'
    end

    flash.now[:notice] = 'Fornecedor não cadastrado'
    render 'new'
  end

  def edit; end

  def update
    if @supplier.update(supplier_params)
      return redirect_to @supplier, notice: 'Fornecedor atualizado com sucesso'
    end

    flash.now[:notice] = 'Não foi possível atualizar o fornecedor'
    render 'edit'
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    supplier_params = params.require(:supplier).permit(:corporate_name, :brand_name, :zip,
                                :registration_number, :full_address, :city, :state, :email)
  end
end