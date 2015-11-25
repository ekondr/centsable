require 'rails_helper'

RSpec.describe Centsable, type: :model do
  context 'given a model with price' do
    let(:product) { Product.create(title: 'test', price: 23.45) }

    it 'should return price as float' do
      expect(product.price).to eq 23.45
    end

    it 'should return price_in_cents as integer' do
      expect(product.price_in_cents).to eq 2345
    end
  end

  context 'given a model without price' do
    let(:product) { Product.create(title: 'test') }

    it 'should return a nil price' do
      expect(product.price).to be_nil
    end

    it 'should return a nil price_in_cents' do
      expect(product.price_in_cents).to be_nil
    end
  end

  context 'given a model with two price attributes' do
    let(:product) { Product.create(title: 'test') }
    let(:price_history) { PriceHistory.create(product: product, price: 45.67, price_old: 12.34) }

    it 'should return price as float' do
      expect(price_history.price).to eq 45.67
      expect(price_history.price_old).to eq 12.34
    end

    it 'should return price_in_cents as integer' do
      expect(price_history.price_in_cents).to eq 4567
      expect(price_history.price_old_in_cents).to eq 1234
    end
  end

  context '#in_cents' do
    it { expect(Product.in_cents(23.45)).to eq 2345 }
    it { expect(Product.in_cents(nil)).to be_nil }
  end
end
