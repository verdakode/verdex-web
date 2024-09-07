# app/controllers/payments_controller.rb

# Handles Stripe payment processing and checkout session creation
class PaymentsController < ApplicationController
  def create_checkout_session
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

    create_session
    render json: { id: @session.id }
  rescue Stripe::StripeError => error
    handle_stripe_error(error)
  rescue StandardError => error
    handle_unexpected_error(error)
  end

  private

  def create_session
    @session = Stripe::Checkout::Session.create(checkout_session_params)
  end

  def checkout_session_params
    {
      payment_method_types: [ "card" ],
      line_items: [ {
        price: params[:priceId],
        quantity: 1
      } ],
      mode: "payment",
      success_url: success_url,
      cancel_url: cancel_url
    }
  end

  def success_url
    "#{request.base_url}/success"
  end

  def cancel_url
    "#{request.base_url}/cancel"
  end

  def handle_stripe_error(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def handle_unexpected_error(error)
    render json: { error: "An unexpected error occurred: #{error.message}" },
           status: :internal_server_error
  end
end
