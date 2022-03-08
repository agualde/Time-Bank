class SkillsController < ApplicationController

  def edit
    @skills = Skill.all
    @user_skills = current_user.skills

  end

  def update
    skill_path = params[:skills_path]
    UserSkill.where(user_id: current_user.id).destroy_all
    skill_path.each do |key, value|
      if value.to_i == 1
        skill = Skill.where(name: key)
        @user_skills = UserSkill.create(user_id: current_user.id, skill_id: skill[0].id)

      end
    end
    redirect_to dashboard_path
  end

end
