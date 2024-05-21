class SessionsController < ApplicationController
  def new

  end
  
  def create
    # TODO: authenticate user
    @user = User.find_by({"email" => params["email"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        flash["notice"] = "Welcome"
        redirect_to "/posts"
       else
        flash["notice"] = "Nope"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Nope"
      redirect_to "/login"
    end
  end

  def destroy

  end

end

