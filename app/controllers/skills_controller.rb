class SkillsController < ApplicationController

  def edit
    @skills = Skill.all
    @skills_array = []
    @skills.each do |skill|
      @skills_array << skill.name
    end
  end

  def update
    skill_path = params[:skills_path]
    UserSkill.where(user_id: current_user.id).destroy_all
    skill_path.each do |key, value|
      if value.to_i == 1
        skill = Skill.where(name: key)
        UserSkill.create(user_id: current_user.id, skill_id: skill[0].id)
      end
    end

    redirect_to dashboard_path
  end

end
