# Centsable

The gem provides ability to store your price values in cents.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'centsable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install centsable

## Usage

Add a column which will store a value in cents:

```ruby
add_column :product, :price, :integer
```

Tell a model that you use price in cents:

```ruby
# app/models/product.rb
class Product < ActiveRecord::Base
  centsable :price # or just centsable
end
```

So you can do this:

```ruby
product = Product.first
product.price # => 23.34
product.price_in_cents # => 2334
Product.in_cents(56.78) # => 5678
product.price = 67.99
product.price_in_cents # => 6799
```

If you need to have some attributes which store cents you can push these names of attributes
into the centsable method:

```ruby
# app/models/price_history.rb
class PriceHistory < ActiveRecord::Base
  belongs_to :product
  centsable :price, :price_old
end
```

## Contributing

1. Fork it ( https://github.com/ekondr/centsable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
