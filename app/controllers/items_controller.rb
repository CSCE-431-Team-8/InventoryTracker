class ItemsController < ApplicationController 
    # eventually will pull from the databse
    def initialize
        @items = Array.new
    end

    public

    def items
        @items = ["The Martian", "Project Hail Mary", "Percy Jackson and the Lightning Theif"]
    end

    # will add to the databse
    def add
        @items.push "new item"
        redirect_to "/items"
    end

end