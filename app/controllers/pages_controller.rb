class PagesController < ApplicationController
  def home
  @title = "Home"
  end
  
  def home
  @title = "testing second Home page"
  end

  def contact
  @title = "Contact"
  end
  
  def about
  @title = "About"
  end

  def signup
  @user = User.new
  @title = "Sign up"
  end
  
  def new
   @user = User.find(params[:id])
   @title = @user.name
   end
   
   def create
   @user = User.new(params[:user])
   if @user.save
   redirect_to new_path(@user)
   
   else
   @title = "sign up"
   render 'signup'
   end
   
  end
end
