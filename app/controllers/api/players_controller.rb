module API
  class PlayersController < ApplicationController
 
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      render json: Player.all, each_serializer: PlayerSerializer
    end

    # GET /api/players/1
    def show
      player = set_player
      if player 
        render json: player, status: 200
      else 
        render json: player, status: 422
      end
    end

    # POST /api/players
    def create
      player = Player.create(player_params)
      if player.valid?
        render json: player, status: 201, location: [:api, player]
      else
        render json: player.errors , status: 422
      end
    end

    # PATCH/PUT /api/players/1
    def update
      player = Player.find(params[:id])
      if player.update_attributes(player_params)
        render json: player
      else
        render json: player.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/players/1
    def destroy
      player = set_player
      if player
        render json: player.destroy, status: 200
      else 
        render json: player, status: 422
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :password_digest)
    end
  end
end
