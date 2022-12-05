class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def show
    @friendships = policy_scope(Friendship)
    @users = User.all
    # if params[:friendship].nil? || params[:friendship][:name] == ""
    #   @user
    # else
    #   @user = User.where(first_name: params[:friendship][:name]).first(10)
    # end
    @requests = User.all
    authorize @user
  end

  def edit
    authorize @user
  end

  # def update
  #   authorize @user
  #   @user.update(permitted_attributes(@user))
  #   redirect_to user_path(@user)
  # end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(policy(@user).permitted_attributes)
    # params.require(:user).permit(:first_name, :password)
  end
end
