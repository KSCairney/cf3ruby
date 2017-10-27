class PaymentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        if user_signed_in?
            @user = current_user
        else
            redirect_to new_user_registration_path
        end
        token = params[:stripeToken]
        @product = Product.find(params[:product_id])
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
            charge = Stripe::Charge.create (
                amount: (@product.price*100).to_i,
                currency: "usd",
                source: token,
                description: params[:stripeEmail]
            )
            if charge.paid
                Order.create(
                    product_id: @product_id,
                    user_id: @user.id,
                    total: @product.price
                    )
            end
        rescue Stripe::CardError => e
             # The card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        end
        redirect_to product_path(product)
    end
end