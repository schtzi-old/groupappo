class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :destroy,:edit, :update]
  def index
    @friendships = policy_scope(Friendship)
    authorize @friendships
    if params[:friendship].nil? || params[:friendship][:name] == ""
      @user = User.all
    else
      @user = User.where(first_name: params[:friendship][:name])
    end
  end

  def show
    authorize @friendship
    if params[:friendship][:name].nil?
      @user.User.first(10)
    else
      @user = User.where(first_name: params[:friendship][:name])
    end

  end

  def create
    @friendship = Friendship.new(friendship_params)
    authorize @friendship
    if @friendship.save
      redirect_to friendships_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @friendship.destroy if current_user.id == @friendship.user_id || current_user.id == @friendship.friend_id
    authorize @friendship
    redirect_to friendships_path, status: :see_other
  end

  def edit
    authorize @friendship
  end



  def update
    authorize @friendship
    if @friendship.update(friendship_params)
      redirect_to friendships_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end

  def new
    @friendship = Friendship.new
    @friendship.user_id = params[:user_id]
    @friendship.friend_id = params[:friend_id]
    @friendship.confirmed = params[:confirmed]
    authorize @friendship
    if @friendship.save
      redirect_to friendships_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
