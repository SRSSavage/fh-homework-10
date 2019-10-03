module API 
  class TeamsController < ApplicationController
    def index 
      render json: Team.all
    end

    def show
      team = set_team
      if team
        render json: team, status: 200
      else
        render json: team, status: 422
      end
    end

    def create
      team = Team.create(team_params)
      if team.valid?
        render json: team, status: 201, location: [:api, team]
      else
        render json: team.errors , status: 422
      end
    end

    private

    def set_team
      @team = Team.find_by(id: params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
  end
end
