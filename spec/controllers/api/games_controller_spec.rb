require 'rails_helper'

module API
  describe GamesController, type: :request do
    describe 'GET /games' do
      it 'retrieves all the requested game' do
        # arrange
        Game.create!(name: 'half field',
                     home_team_id: 1,
                     away_team_id: 1)

        # act
        get api_games_url,
            as: :json

        # assert
        expect(response.status).to eq(200)
      end
    end

    describe 'GET /games/:id' do
      context 'with valid params' do
        it 'retrieves the requested game' do
          # arrange
          game = Game.create!(name: 'half field',
                              home_team_id: 1,
                              away_team_id: 1)

          # act
          get api_game_url(game),
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'retrieves the requested game' do
          # arrange
          game_id = -1

          # act
          get api_game_url(game_id),
              as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'POST /games' do
      context 'with valid params' do
        it 'creates a new Game' do
          # arrange
          game = Game.create!(name: 'half field',
                              home_team_id: 1,
                              away_team_id: 1)

          # act / assert
          expect {
            post api_games_url,
                 params: { game: game.attributes },
                 as: :json
          }.to change(Game, :count).by(1)

          # TODO: extract into another example
          expect(response.status).to eq(201)
        end
      end

      context 'with invalid params' do
        it 'creates a new game' do
          # arrange
          invalid_attributes = { name: '', home_team_id: nil, away_team_id: nil}

          # act / assert
          expect {
            post api_games_url,
                 params: { games: invalid_attributes },
                 as: :json
          }.to change(Game, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'PUT /games/:id' do
      context 'with valid params' do
        it 'updates the requested game' do
          # arrange
          game = Game.create!(name: 'half field',
                              home_team_id: 1,
                              away_team_id: 1)
          new_attributes = { name: 'Jane', home_team_id: 1, away_team_id: 1 }

          # act
          put api_game_url(game),
              params: { game: new_attributes },
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'updates the requested game' do
          # arrange
          game = Game.create!(name: 'half field',
                              home_team_id: 1,
                              away_team_id: 1)
          invalid_attributes = { name: '', home_team_id: nil , away_team_id: nil }

          # act
          patch api_game_url(game),
                params: { game: invalid_attributes },
                as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'DELETE /games/:id' do
      context 'with valid params' do
        it 'destroys the requested game' do
          # arrange
          game = Game.create!(name: 'half field',
                              home_team_id: 1,
                              away_team_id: 1)

          # act / assert
          expect {
            delete api_game_url(game),
                   as: :json
          }.to change(Game, :count).by(-1)

          # TODO: extract into another example
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'destroys the requested player' do
          # arrange
          game_id = -1

          # act / assert
          expect {
            delete api_game_url(game_id),
                   as: :json
          }.to change(Game, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
