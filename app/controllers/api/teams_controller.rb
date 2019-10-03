module API
  class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :update, :destroy]

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

    def update
      team = Team.find(params[:id])
      if team.update_attributes(team_params)
        render json: team
      else
        render json: team.errors, status: :unprocessable_entity
      end
    end

    def destroy
      team = set_team
      if team
        render json: team.destroy, status: 200
      else 
        render json: team, status: 422
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
