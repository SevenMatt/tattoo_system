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

  # Permitindo name no DEVISE
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up, keys: [:name])
  end
end
