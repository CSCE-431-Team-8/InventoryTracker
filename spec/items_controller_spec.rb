require "../app/controllers/items_controller.rb"

describe ItemsController do
    describe "new" do 
        it "Creates a new Items controller" do
            expect{ @myItem.new }.to_not raise_error
            # @myItem = ItemsController.new
            expect(@myItem).to be_an_instance_of(ItemsController)
        end
        #Test invalid/throw argument
        # it 'Does not create an item properly' do 
        #     expect{ @myItem.new }.to_not raise_error
        # end
    end
    describe 'increase_quantity' do 
    
        context 'correct' do
            it 'increases the quantity of an item by 1' do
                @myItem = ItemsController.new
                originalCount = @myItem.quantity_remaining
                @myItem.increase_quantity

                expect(@myItem.quantity).to eq(originalCount + 1) # Not sure if @myItem.quantity_r or :quantity_r
            end
        end
    end
    describe 'decrease_quantity' do 
    
        context 'correct' do
            it 'decreases the quantity of an item by 1' do
                @myItem = ItemsController.new
                originalCount = @myItem.quantity_remaining
                @myItem.decrease_quantity

                expect(@myItem.quantity).to eq(originalCount - 1) # Not sure if @myItem.quantity_r or :quantity_r
            end
        end
    end

    # Must add destroy invalid
    
end