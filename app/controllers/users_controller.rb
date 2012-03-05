class UsersController < ApplicationController

before_filter :authenticate, :only => [:index, :edit, :update]
before_filter :correct_user, :only => [:edit, :update]
before_filter :admin_user,	 :only => :destroy

  def index
	@user = User.order("name").page(params[:page]).per(2)
	@title = 'All users'
  end
  
  
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
		render 'users'
		end
	end
	
	
	def destroy
	
	User.find(params[:id]).destroy
	
	@user = current_user
	redirect_to :back
	
	
	end
	
	
	def authenticate
	
	redirect_to signin_path unless signed_in?
	
	end
	
	def correct_user
	
	@user = User.find(params[:id])
	redirect_to(root_path) unless current_user?(@user)
	
	end
	
	def admin_user
	user = User.find(params[:id])
	
	redirect_to(root_path) if (!current_user.admin? || current_user?(user))
	
	end
	
	def forgotpassword
		if request.post?
			@user = User.find_by_email(params[:user][:email])
			user = User.find_by_email(params[:user][:email])
			if user
				
				user = User.create_reset_code(params[:id])
				
				@user.save
				@title = "Sign in"
				redirect_to :back
			else
			redirect_to :back
			end
			
			

		end
	end
  
  
	def reset
	
	@user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
	
		if request.post?
			if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
			self.current_user = @user
			@user.delete_reset_code
			redirect_back_or_default('/')
			
			else
			render :action => :reset
			end
		end
	
	
	end
  
  
end
