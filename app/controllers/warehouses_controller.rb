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
    
    warehouse = Warehouse.new(params_warehouse)
    
    if warehouse.save
      flash[:notice] = 'Galpão cadastrado com sucesso'
      return redirect_to root_path
    end
    

  end
end