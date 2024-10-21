class OrdersController < ApplicationController
  before_action :authenticate_user!
  def show
    @order = Order.find(params[:id])
  end
  def new
    @order = Order.new
    @warehouses = Warehouse.all
    @suppliers = Supplier.all
  end

  def create
    order_params = params.require(:order).permit(:warehouse_id, :supplier_id, :estimated_delivery_date)
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      return redirect_to @order, notice: 'Pedido registrado com sucesso'
    end

    @warehouses = Warehouse.all
    @suppliers = Supplier.all
    flash.now[:notice] = 'Não foi possível registrar o pedido'
    render 'new'
  end
end
