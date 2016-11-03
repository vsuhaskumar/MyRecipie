class ChefsController < ApplicationController
    
    def new
        @chef = Chef.new
    end
    
    def create
        #binding.pry
        @chef = Chef.new(chef_params)
        if @chef.save 
            flash[:success] = "Your account has been created successfully"
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
    
    private
        def chef_params
            params.require(:chef).permit(:chefname, :email, :password)
        end
    
end 