class PriceHistory < ActiveRecord::Base
  belongs_to :product

  centsable :price, :price_old
end
