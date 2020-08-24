## Syft Code Test

- The solution uses the Money gem. The gem can be installed by running `bundle install`
- Bundler version is 2.1.4
- The Checkout class is initialised with an array of promotional rules, for example
-        checkout = Checkout.new([Rule1, Rule2])
- *Rule1 and Rule2 are class names of the promotional rules*
- Product codes are scanned, for example
        checkout.scan('001')
- The app reads from data.csv to obtain the list of products
