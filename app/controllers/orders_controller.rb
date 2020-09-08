class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    redirect root_path unless (user_signed_in? && current_user != @item.user)
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    binding.pry

    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :place_id, :city, :house_number, :building_name, :phone_number).merge(user_id:current_user.id,item_id:@item.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
