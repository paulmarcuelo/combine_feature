class CartsController < ApplicationController
    before_action :authenticate_user!

    def index
    
    end

    def create
        if current_user.carts.where(product_id: params[:product_id]).count == 0
            cart = Cart.new(cart_params)
            cart.save
            @messages = "#{cart.product.name} is added to the cart"
        else
            cart = current_user.carts.where(product_id: params[:product_id]).first
            @messages = "#{cart.product.name} is already in the cart"
        end

        respond_to do |format|
            format.js
        end
    end

    private
    def cart_params
        params.permit(:product_id, :quantity, :user_id)
    end
end
