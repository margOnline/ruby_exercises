checkout
========

<h4>Objective</h4>
Implement a checkout system for an online retailer with the flexibility to add / change promotions.
<h4>Requirements</h4>
<ol>
  <li>The check-out can scan items in any order.</li>
  <li>Promotional rules
    <ul>
      <li>Minimum Spend e.g. If total spend is over £60, 10% is taken off the total.</li>
      <li>Multi Buy e.g. If 2 or more of a specified product is purchased, that product's price is reduced.</li>
    </ul>
  </li>
  <li>The checkout system must be implemented without the use of a framework.</li>
</ol>
<p>Checkout interface:</p>
<p>
  co = Checkout.new(promotional_rules)
  <br />co.scan(item)
  <br />co.scan(item)
  <br />price = co.total
</p>
<h4>Technical Configuration</h4>
<ul>
  <li>Language: Ruby</li>
  <li>Testing: RSpec</li>
</ul>
<h4>Set up</h4>
1.  In Terminal, go to your projects directory and clone the project:

        git clone git@github.com:margOnline/checkout.git

2.  Run the tests to make sure they pass with your environment:

        rspec spec

3.  Run the app to ensure you get the expected results:

        ./app.rb

<h4>Future features</h4>
<ol>
  <li>Add a product catalog</li>
  <li>Handle out of stock products.</li>
  <li>Apply an expiry date to a promotional rule.</li>
  <li>Allow additional promotional rules.</li>
</ol>