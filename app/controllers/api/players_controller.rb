module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      @player = Player.all
      render json: @player
    end

    # GET /api/players/1
    def show
      render json: @player
    end

    # POST /api/players
    def create
      @player = Player.create(player_params)
    end

    # PATCH/PUT /api/players/1
    def update
      if @player.update(player_params)
        render json: @player
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/players/1
    def destroy
      @player = Player.find(params[:id])
      @player.destroy
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
