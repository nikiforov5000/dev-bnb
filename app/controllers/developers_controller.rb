class DevelopersController < ApplicationController
  before_action :set_developer, only: :show
  def index 
   # if params[:query].present? 
    #  @query = params[:query]
    #  @developers = Developer.where("name LIKE ?", "%#{params[:query]}%")
   # else
      @developers = Developer.all
    # end
  end

  def show; end

  private

  def set_developer
    @developer = Developer.find(params[:id])
  end

end
