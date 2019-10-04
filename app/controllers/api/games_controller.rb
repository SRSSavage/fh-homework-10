module API
  class GamesController < ApplicationController
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




    private

    def set_game
      @game = Game.find_by(id: params[:id])
    end

    def game_params
      require(:game).permit(:name, :home_team_id, :away_team_id)
    end
  end
end
