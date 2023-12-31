require 'rails_helper'

RSpec.describe Order do
  describe "#submit" do
    before do
      @book = Book.new(:title => "RSpec Intro", :price => 20)
      @customer = Customer.new
      @order = Order.new(@customer, @book)

      @order.submit
    end

    before(:each) do 
      puts "Runs before each Example" 
    end 
    
    after(:each) do 
      puts "Runs after each Example" 
    end 
    
    before(:all) do 
      puts "Runs before all Examples" 
    end 
    
    after(:all) do 
      puts "Runs after all Examples"
    end 
    
    describe "customer" do
      it "puts the ordered book in customer's order history" do
        expect(@customer.orders).to include(@order)
        expect(@customer.ordered_books).to include(@book)
      end
    end

    describe "order" do
      it "is marked as complete" do
        expect(@order).to be_complete
      end
 
      it "is not yet shipped" do
        expect(@order).not_to be_shipped
      end
    end
  end
end