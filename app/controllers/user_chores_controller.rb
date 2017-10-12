class UserChoresController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @user_chores = UserChore.all
    else
      redirect_to '/login'
  end

  def show
    if logged_in?
      @user_chore = UserChore.find_by(params[:id])
    else
      redirect_to '/login'
  end

  def new
    @user_chore = UserChore.new
  end

  def create
    @user = User.find_by(params[:id])
    @chore = Chore.find_by(params[:id])
    @user_chore = UserChore.new(user_chore_params)
    if @user_chore.save
      redirect_to user_chores_path
    else

      render :'chores/show'
    end
  end

  def update
    @user_chore = UserChore.find(params[:id])
    @user_chore.update(user_chore_params)

    redirect_to user_chores_path
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:chore_id, :user_id, :status)
    end

end