class DevelopersController < ApplicationController

  before_action :set_developer, only: :show

  def index
    @specialtys = %w[PHP JS Ruby Web-Design C++ Pascal C# CSS HTML SASS jQuery Java C Python]
    if params[:query].present?
      sql_query = "\
        developers.specialty @@ :query \
        OR developers.bio @@ :query \
        "
      @developers = Developer.where(sql_query, query: "%#{params[:query]}%")
    else
      @developers = Developer.all
    end
  end

  def show
    @developer
    @reviews = Review.select do |review|
      review.developer == @developer
    end
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
    params.require(:developer).permit(:name, :specialty, :age, :bio, :daily_rate, :photo)
  end
end
