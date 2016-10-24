class RecipesController < ApplicationController
   
   def index
    @recipes = Recipe.all  #instance variable, so it wil be available in view 
   end
    
   def show
    @recipe = Recipe.find(params[:id]) 
    #binding.pry #making use of gem pry which was added
   end
    
end    