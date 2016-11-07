class ChefsController < ApplicationController
    
    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 4)
    end
    
    
    def new
        @chef = Chef.new
    end
    
    def create
        #binding.pry
        @chef = Chef.new(chef_params)
        if @chef.save 
          flash[:success] = "Your account has been created successfully"
          session[:chef_id] = @chef.id #once they sign up, they are automatically logged in.
          redirect_to recipes_path #want to redirect to index of recipes 
        else
            render 'new'
        end
    end 
     
    def edit
         @chef = Chef.find(params[:id])
      
    end

    def update
        #binding.pry
        @chef = Chef.find(params[:id])      
        if @chef.update(chef_params) 
            flash[:success] = "Your profile has ben updated successfully"
             redirect_to recipes_path #to change to show chef page
        else
            render 'edit'
        end
    end
    
    
    def show
       @chef = Chef.find(params[:id]) 
       @recipes = @chef.recipes.paginate(page: params[:page], per_page: 4)
    end
    
    
    private
        def chef_params
            params.require(:chef).permit(:chefname, :email, :password)
        end
    
end 