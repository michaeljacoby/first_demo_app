class PagesController < ApplicationController
  def home
  @title = "Home"
  end
  
  def hometest
  @title = "testing second Home page"
  end

  def contact
  @title = "Contact"
  end
  
  def about
  @title = "About"
  end


  

   
   def create
   @user = User.new(params[:user])
   if @user.save
   redirect_to @user
   
   else
   @title = "sign up"
   render 'show'
   end
   
  end
end
