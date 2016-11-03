class RecipesController < ApplicationController
   
   def index
    #instance variable, so it wil be available in view
    #@recipes = Recipe.all.sort_by{|like| like.thumbs_up_total}.reverse  
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
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
   
   
   def like
    #binding.pry
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe) #will set like = true
        if like.valid?
            flash[:success] = "Your selection was successful"
            redirect_to :back #will redirect back to same page 
        else
            flash[:danger] = "You can only like/dislike a recipe once"
            redirect_to :back
        end
   end
   
   
   private 
    
    def  recipe_params 
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
    
end    