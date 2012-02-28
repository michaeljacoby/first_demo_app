class UsersController < ApplicationController

  
  def new
  @user = User.new
  @title = "Sign up"
  end
  
  def show 
  @user = User.find(params[:id])
  @title = @user.name
  end  
  
  def create
	@user = User.new(params[:user])
		if @user.save
			redirect_to @user
		else
			@title = "Sign up"
			render 'new'
		end
	
	end
	
	
	def edit
	@user = User.find(params[:id])
		@title = "edit user"
	end
	
	def update
	
	@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
		redirect_to @user
		else
	
		@title = "Edit user"
		render 'edit'
		end
	end
  
  
  
end
