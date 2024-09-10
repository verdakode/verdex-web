import { loadStripe, Stripe } from '@stripe/stripe-js';

const stripePromise = loadStripe('your_publishable_key');

export const handlePurchase = async (priceId: string): Promise<void> => {
  const stripe: Stripe | null = await stripePromise;

  if (!stripe) {
    throw new Error('Stripe failed to load');
  }

  const response = await fetch('/payments/create_checkout_session', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
    },
    body: JSON.stringify({ priceId: priceId })
  });

  if (!response.ok) {
    throw new Error('Network response was not ok');
  }

  const session = await response.json();
  const result = await stripe.redirectToCheckout({ sessionId: session.id });

  if (result.error) {
    alert('There was an error processing your payment. Please try again.');
  }
};
