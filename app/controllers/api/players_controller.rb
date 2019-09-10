module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      player = Player.all
      render json: player, status: :ok
    end

    # GET /api/players/1
    def show
      player = Player.find(params[:id])
      render json: player
    end

    # POST /api/players
    def create
      player = Player.new(player_params)
      if player.save
        render json: player, status: 201, location: [:api, player]
      else
        render json: { errors: player.errors }, status: 422
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
      player = Player.find(params[:id])
      player.destroy
      render json: {status: "success"}
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :position)
    end
  end
end
