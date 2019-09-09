module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      @player = Player.all 
    end

    # GET /api/players/1
    def show
      # implement your code here
    end

    # POST /api/players
    def create
      # implement your code here
    end

    # PATCH/PUT /api/players/1
    def update
      # implement your code here
    end

    # DELETE /api/players/1
    def destroy
      # implement your code here
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
