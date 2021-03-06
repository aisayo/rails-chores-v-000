class UserChoresController < ApplicationController
  include ApplicationHelper
  before_action :authorize
  load_and_authorize_resource

  def index
    @user_chores = UserChore.includes(:user, :house_chore => :chore)
    #@user_chore = UserChore.find_by(params[:user_chore_id])

    # render 'user_chores/index'#, :layout => false
    render :json => @user_chores.to_json({:include => {:user => {}, :house_chore => {:include => :chore}}})
  end

  def show
    @overdue_chores = UserChore.overdue

    render :json => @overdue_chores.to_json({:include => {:user => {}, :house_chore => {:include => :chore}}})
  end

  def new
    @user_chore = UserChore.new
  end

  def create
    @user = User.find_by(params[:id])
    @house_chore = HouseChore.find_by(params[:id])
    @user_chore = UserChore.new(user_chore_params)

    if @user_chore.save
      #raise params.inspect
      redirect_to user_chores_path
    else

      render :'house_chores/show'
    end
  end

  def update
    @user_chore = UserChore.find(params[:id])
    @user_chore.update(user_chore_params)
    authorize! :update, @user_chore

    redirect_to user_chores_path
  end

  def destroy
    @user_chore = UserChore.find(params[:id])
    @user_chore.destroy

    redirect_to user_chores_path
  end

  private
    def user_chore_params
      params.require(:user_chore).permit(:house_chore_id, :user_id, :due_date, :status)
    end

end
