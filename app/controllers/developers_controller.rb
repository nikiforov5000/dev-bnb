class DevelopersController < ApplicationController
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

  def developer_params
    params.require(:developer).permit(:name, :specialty, :age, :bio, :daily_rate)
  end
end
