require "pry"

class CashRegister 
    
    attr_accessor :discount, :total, :void
    attr_reader :items 
 

    def initialize(discount = 0)
        @discount = discount 
        @total = 0 
        @items = []
        @void = {item: nil, price: nil, quantity: nil}
    end 

    def add_item(item, price, quantity = 1) 
        self.total += price * quantity
        quantity.times do 
            items << item 
        end 
        self.void = {item: item, price: price, quantity: quantity}
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else 
            percent = (100.0 - self.discount) / 100
            self.total *= percent
            "After the discount, the total comes to $#{total.to_i}."
        end       
    end

    def void_last_transaction 
        self.total -= self.void[:price] * self.void[:quantity]
    end
end