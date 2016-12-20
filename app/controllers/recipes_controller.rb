class RecipesController < ApplicationController
   
   before_action :set_recipe, only: [:edit, :update, :show, :like]
   before_action :require_user, except: [:show, :index] #only logged in user can create new recipe, this method is defined in application controller, so it is available to entire app
   before_action :require_same_user, only: [:edit, :update]
   
   
   def index
    #instance variable, so it wil be available in view
    #@recipes = Recipe.all.sort_by{|like| like.thumbs_up_total}.reverse  
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
   end
     
   def show
    #binding.pry #making use of gem pry which was added
   end
   
   
   def new 
    @recipe = Recipe.new
   end
   
   def create
    
    #binding.pry .. In console ...params ... this will tell what all we are getting
    @recipe = Recipe.new(recipe_params) #match the signature and will take data to new create new recipe
    @recipe.chef = current_user
    
      if @recipe.save
        flash[:success] = "Your recipe was create successfully"
        redirect_to recipes_path
      else
     
        render :new 
      end
    
   end
   
   
   def edit
       
   end
   
   
   def update
      if @recipe.update(recipe_params)
        flash[:success] = "Your recipe was updated successfully"
        redirect_to recipes_path(@recipe)
      else
        render :edit
      end
   end
   
   
   def like
    #binding.pry
   
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe) #will set like = true
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
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_user
        if current_user != @recipe.chef
          flash[:danger] = "You can only edit your own recipies"
          redirect_to recipes_path
        end
    end
        
end    