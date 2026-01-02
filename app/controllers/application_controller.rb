class ApplicationController < ActionController::Base
  def index
    @users = User.All
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to Users_path
    else
      render :new
    end
end

private

  def user:params 
    params.require(:user).permit(:name, :email)
  end
end
