# app/controllers/payments_controller.rb

# Handles creation of Stripe Checkout sessions
class PaymentsController < ApplicationController
  def create_checkout_session
    # Set up Stripe API key
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    # Create a Stripe Checkout session
    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      line_items: [{
        price: params[:price_id],
        quantity: 1,
      }],
      mode: "payment",
      success_url: "#{request.base_url}/success",
      cancel_url: "#{request.base_url}/cancel",
    })

    render json: { id: session.id }
  rescue Stripe::StripeError => error
    render json: { error: error.message }, status: :unprocessable_entity
  end
end
