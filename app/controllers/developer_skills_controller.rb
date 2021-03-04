class DeveloperSkillsController < ApplicationController
  before_action :set_developer, only: [:new, :create]
  before_action :set_skill, only: :create

  def new
    @developer_skill = DeveloperSkill.new
  end

  def create
    @developer_skill = DeveloperSkill.new(developer_skill_params)
    @developer_skill.skill = @skill
    @developer_skill.developer = @developer
    if @developer_skill.save
      redirect_to developer_path(@developer)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @developer_skill = DeveloperSkill.find(params[:id])
    @developer = @developer_skill.developer
    @developer_skill.destroy
    redirect_to developer_path(@developer)
  end

  private

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end

  def set_skill
    @skill = Skill.find(params[:developer_skill][:skill_id])
  end

  def developer_skill_params
    params.require(:developer_skill).permit(:years_of_experience)
  end
end
