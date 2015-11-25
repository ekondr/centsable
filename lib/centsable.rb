require 'centsable/version'

module Centsable
  extend ActiveSupport::Concern

  class_methods do
    def centsable(*attrs)
      columns = attrs.length == 0 ? [:price] : attrs

      columns.each do |column|
        define_method("#{column}=".to_sym) do |value|
          self[column] = (value.to_f * 100).to_i
        end

        define_method("#{column}".to_sym) do
          return nil if self[column].nil?
          1.00 * self[column] / 100
        end

        define_method("#{column}_in_cents".to_sym) do
          self[column]
        end
      end

      define_singleton_method :in_cents do |value|
        return nil if value.nil?
        (value * 100).to_i
      end
    end
  end
end

ActiveRecord::Base.send(:include, Centsable)
