class RecipesController < ApplicationController
   
   def index
    @recipes = Recipe.all  #instance variable, so it wil be available in view 
   end
    
   def show
    @recipe = Recipe.find(params[:id]) 
    #binding.pry #making use of gem pry which was added
   end
   
   
   def new 
    
    @recipe = Recipe.new
    
   end
   
   def create
    
    #binding.pry .. In console ...params ... this will tell what all we are getting
    @recipe = Recipe.new(recipe_params) #match the signature and will take data to new create new recipe
    @recipe.chef = Chef.find(5)
    
      if @recipe.save
        flash[:success] = "Your recipe was create successfully"
        redirect_to recipes_path
      else
     
        render :new 
      end
    
   end
   
   
   def edit
    @recipe = Recipe.find(params[:id])
   end
   
   
   def update
     @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        flash[:success] = "Your recipe was updated successfully"
        redirect_to recipes_path(@recipe)
      else
        render :edit
      end
   end
   
   
   private 
    
    def  recipe_params 
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
    
end    