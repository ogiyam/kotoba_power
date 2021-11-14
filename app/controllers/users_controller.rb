class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user
  
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
end
