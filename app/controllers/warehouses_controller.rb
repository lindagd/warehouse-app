class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    params_warehouse = params.require(:warehouse).permit(:name,
                          :description, :code, :address,
                          :city, :cep, :area)   
    
    @warehouse = Warehouse.new(params_warehouse)

    if @warehouse.save
      return redirect_to root_path, notice: 'Galpão cadastrado com sucesso'
    end

    flash.now[:notice] = 'Galpão não cadastrado: Campos preenchidos incorretamente'
    render 'new'
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])

    warehouse_params = params.require(:warehouse).permit(:name,
                                  :description, :code, :address,
                                  :city, :cep, :area)
    
    if @warehouse.update(warehouse_params)
      return redirect_to warehouse_path(@warehouse.id), notice: 'Galpão atualizado com sucesso'
    end

    flash.now[:notice] = 'Não foi possível atualizar o galpão'
    render 'edit'
  end
end