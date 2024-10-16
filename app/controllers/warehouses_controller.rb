class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:edit, :update, :show]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      return redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
    end

    flash.now[:notice] = 'Galpão não cadastrado: Campos preenchidos incorretamente'
    render 'new'
  end

  def edit; end

  def update
    if @warehouse.update(warehouse_params)
      return redirect_to warehouse_path(@warehouse.id), notice: 'Galpão atualizado com sucesso'
    end

    flash.now[:notice] = 'Não foi possível atualizar o galpão'
    render 'edit'
  end


  private
  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    warehouse_params = params.require(:warehouse).permit(:name,
                                  :description, :code, :address,
                                  :city, :cep, :area)
  end
end