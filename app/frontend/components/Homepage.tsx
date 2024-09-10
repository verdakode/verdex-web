import React from 'react';

const Homepage: React.FC = () => {
  const handlePurchase = async (priceId: string) => {
    const stripe = (window as any).Stripe('pk_live_51PwDokP4AzUY99eBtVGNLQCxkX4ScKz93XdImlU9wc4uxbQ2eAO2qvPIvvi1z5YR0s5pPES84O3QWBbcFLlBX1V600cMJ8hROZ');
    try {
      const response = await fetch('/create-checkout-session', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ priceId }),
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const session = await response.json();
      await stripe.redirectToCheckout({ sessionId: session.id });
    } catch (error) {
      console.error('Error:', error);
      alert('There was an error processing your payment. Please try again.');
    }
  };

  return (
    <>
      <header>
        <div className="container">
          <nav>
            <h1>Verdex</h1>
            <div id="search">
              <input type="text" id="search-bar" placeholder="Discover rare treasures..." />
              <button id="search-button"><i className="fas fa-search"></i></button>
            </div>
          </nav>
        </div>
      </header>

      <div className="banner">
        <p><i className="fas fa-truck"></i> Same Day Delivery available in San Francisco!</p>
      </div>

      <main>
        <div className="container">
          <section id="catalog">
            <h2>Exclusive Finds</h2>
            <div className="item-grid">
              <div className="item">
                <img src="images/seventeensquare.png" alt="Anti-Over-Engineering Puzzle" />
                <h3>The Anti-Over-Engineering Puzzle</h3>
                <p className="description">"think better not more"</p>
                <a href="https://www.combinatorics.org/files/Surveys/ds7/ds7v5-2009/ds7-2009.html" className="button-style">
                  Explore the Math
                </a>
                <button 
                  className="buy-now" 
                  onClick={() => handlePurchase('price_1PwInWP4AzUY99eBKsTcTdzT')}
                >
                  Acquire Now
                </button>
              </div>
            </div>
          </section>
        </div>
      </main>

      <footer>
        <p>&copy; 2023 Verdex.</p>
      </footer>
    </>
  );
};

export default Homepage;
