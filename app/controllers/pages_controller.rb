class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def contact
  @title = "Contact"
  end
  
  def about
  @title = "About"
  end

  def signup
  @title = "Sign up"
  end
  
  def new
   @user = User.find(1)
   end
   
  
end
