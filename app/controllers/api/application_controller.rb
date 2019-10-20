module Api
    class ApplicationController < ActionController::API
      include Knock::Authenticable
      undef_method :current_player
  end
end