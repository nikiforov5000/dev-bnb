class DevelopersController < ApplicationController

  before_action :set_developer, only: :show
  def index 
   # if params[:query].present? 
    #  @query = params[:query]
    #  @developers = Developer.where(name: "%#{params[:query]}%")
   # else
    @developers = Developer.all
   # end
  end

  def show
    @developer
  end
  

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    @developer.owner = current_user
    if @developer.save
      redirect_to developer_path(@developer)
    else
      render :new
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:name, :specialty, :age, :bio, :daily_rate)
  end

end
