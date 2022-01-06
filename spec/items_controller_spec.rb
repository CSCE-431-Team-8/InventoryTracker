require "items_controller"

describe ItemsController do
    describe "new" do 
        it "Creates a new Items controller" do
            @myItems = ItemsController.new
            expect(@myItems).to be_an_instance_of(ItemsController)
            expect(@myItems.items).to eq([])
        end
    end
    describe 'addItem' do
        context 'correct' do
            it "Adds an item to the existing items array" do 
                @myItems = ItemsController.new
                @myItems.addItem("The Poppy War")
                @myItems.addItem("Dune")
                expect(@myItems.items.include? "The Poppy War").to eq(true)
                expect(@myItems.items.include? "Dune").to eq(true)
            end
        end
        context 'invalid' do 
            before :each do 
                @myItems = ItemsController.new
                @myItems.addItem("The Cat in the Hat")
            end
            it 'Does not add an existing item' do 
                originalSize = @myItems.items.size
                expect{ @myItems.addItem("The Cat in the Hat") }.to raise_error(ArgumentError)
                expect(@myItems.items.size).to eq(originalSize)
            end
            it 'throws an error when item is blank' do
                expect{ @myItems.addItem('') }.to raise_error(ArgumentError)
            end
        end
  end
    describe 'removeItem' do
        context 'correct' do 
            before each do 
                @myItems = ItemsController.new
                @myItems.addItem("Dune")
                @myItems.addItem("The Cat in the Hat")
                @myItems.addItem("The Poppy War")
            end 
            it 'Removes an item correctly' do 
                @myItems.removeItem("Dune")
                @myItems.removeItem("The Cat in the Hat")
                expect(@myItems.items.include? "Dune").to eq(false)
                expect(@myItems.items.include? "The Cat in the Hat").to eq (false)
            end
        end
        context 'invalid' do 
            before each do
                @myItems = ItemsController.new
            end
            it 'Does not remove a non existent item' do 
                @myItems.addItem("Dune")
                expect(@myItems.removeItem("The Martian")).to raise_error(ArgumentError)
            end
            it 'Throws an error when item is blank' do
                expect{ @myItems.removeItem('') }.to raise_error(ArgumentError)
            end
        end
    end
end