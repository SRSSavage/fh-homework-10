module API 
  class TeamsController < ApplicationController
    def index 
      render json: Team.all
    end
  end
end
