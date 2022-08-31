class JoinTeamsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  def create
    if current_user.name == 'ゲストユーザー'
      redirect_to teams_path, notice: 'ゲストユーザーはチームに参加できません'
    else
      join_team = current_user.join_teams.create(team_id: params[:team_id])
      redirect_to teams_path, notice: "#{join_team.team.team_name}のチームに登録しました"
    end
  end

  def destroy
    join_team = current_user.join_teams.find_by(id: params[:id]).destroy 
    redirect_to teams_path, notice: "#{join_team.team.team_name}のチームから外れました"
  end
end
