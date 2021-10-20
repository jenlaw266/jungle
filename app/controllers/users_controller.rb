class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params.email.downcase!
    puts "--------------------"
    puts user_params.inspect
    @user = User.new(user_params)
    
    if @user.save!
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/users'
    end
  end   

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
