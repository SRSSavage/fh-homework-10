module API
  class GamesController < ApplicationController
    before_action :set_game, only: [:show, :update, :destroy]

    def index
      render json: Game.all
    end

    def show
      game = set_game
      if game
        render json: game, status: 200
      else 
        render json: game, status: 422
      end
    end

    def create
      game = Game.create(game_params)
      if game.valid?
        render json: game, status: 201, location: [:api, game]
      else
        render json: game.errors , status: 422
      end
    end

    def update
      game = Game.find(params[:id])
      if game.update_attributes(game_params)
        render json: game
      else
        render json: game.errors, status: :unprocessable_entity
      end
    end

    def destroy
      game = set_game
      if game
        render json: game.destroy, status: 200
      else 
        render json: game, status: 422
      end
    end

    private

    def set_game
      @game = Game.find_by(id: params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :away_team_id, :home_team_id)
    end
  end
end
