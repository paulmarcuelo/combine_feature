class CheckoutController < ApplicationController
    def create
        products = Product.find(params[:product_id])
        quantities = params[:quantity]

        #check if the user click buy now, or checkout cart
        if products.kind_of?(Array) 
            checkout_items = (0...products.count).collect do |product_num|
                {
                    name: products[product_num].name,
                    description: products[product_num].description,
                    amount: products[product_num].price,
                    currency: 'cad',
                    quantity: quantities[product_num]
                }
            end
        else
            checkout_items = [{
                name: products.name,
                description: products.description,
                amount: products.price,
                currency: 'cad',
                quantity: quantities
            }]
        end

        #session of checkout
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: checkout_items,
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js
        end
    end
    
    def success
        
    end

    def cancel
        
    end
end
