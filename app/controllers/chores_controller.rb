class ChoresController < ApplicationController
  include ApplicationHelper
  before_action :authorize

  def index
    @chore = Chore.new
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
    respond_to do |f|
      f.json { render :json => @chore }
      f.html { render :show }
    end
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
    authorize! :create, @chore

      redirect_to chores_path
    else
      render :index
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    redirect_to chores_path
  end

  private

  def chore_params
    params.require(:chore).permit(:name, :house_id)
  end

end
