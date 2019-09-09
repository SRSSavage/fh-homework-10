require 'rails_helper'

module API
  describe PlayersController, type: :request do
    describe 'GET /players' do
      it 'retrieves all the requested player' do
        # arrange
        Player.create!(first_name: 'John', 
                       last_name: 'Doe', 
                       email: 'john.doe@example.com', 
                       age: 25, 
                       position: 'goalkeeper')

        # act
        get api_players_url,
            as: :json

        # assert
        expect(response.status).to eq(200)
      end
    end

    describe 'GET /players/:id' do
      context 'with valid params' do
        it 'retrieves the requested player' do
          # arrange
          player = Player.create!(first_name: 'John',
                                  last_name: 'Doe',
                                  email: 'john.doe@example.com',
                                  age: 25,
                                  position: 'goalkeeper')

          # act
          get api_player_url(player),
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'retrieves the requested player' do
          # arrange
          player_id = -1

          # act
          get api_player_url(player_id),
              as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'POST /players' do
      context 'with valid params' do
        it 'creates a new Player' do
          # arrange
          player = Player.new(first_name: 'John',
                              last_name: 'Doe',
                              email: 'john.doe@example.com',
                              age: 25,
                              position: 'goalkeeper')

          # act / assert
          expect {
            post api_players_url,
                 params: { player: player.attributes },
                 as: :json
          }.to change(Player, :count).by(1)

          # TODO: extract into another example
          expect(response.status).to eq(201)
        end
      end

      context 'with invalid params' do
        it 'creates a new player' do
          # arrange
          invalid_attributes = { first_name: '', last_name: '', email: '', age: 0, position: '' }

          # act / assert
          expect {
            post api_players_url,
                 params: { player: invalid_attributes },
                 as: :json
          }.to change(Player, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'PUT /players/:id' do
      context 'with valid params' do
        it 'updates the requested player' do
          # arrange
          player = Player.create!(first_name: 'John',
                                  last_name: 'Doe',
                                  email: 'john.doe@example.com',
                                  age: 25,
                                  position: 'goalkeeper')
          new_attributes = { first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', age: 24 }

          # act
          put api_player_url(player),
              params: { player: new_attributes },
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'updates the requested player' do
          # arrange
          player = Player.create!(first_name: 'John',
                                  last_name: 'Doe',
                                  email: 'john.doe@example.com',
                                  age: 25,
                                  position: 'goalkeeper')
          invalid_attributes = { first_name: '', last_name: '', email: '', age: 0, position: '' }

          # act
          patch api_player_url(player),
                params: { player: invalid_attributes },
                as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'DELETE /players/:id' do
      context 'with valid params' do
        it 'destroys the requested player' do
          # arrange
          player = Player.create!(first_name: 'John',
                                  last_name: 'Doe',
                                  email: 'john.doe@example.com',
                                  age: 25,
                                  position: 'goalkeeper')

          # act / assert
          expect {
            delete api_player_url(player),
                   as: :json
          }.to change(Player, :count).by(-1)

          # TODO: extract into another example
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'destroys the requested player' do
          # arrange
          player_id = -1

          # act / assert
          expect {
            delete api_player_url(player_id),
                   as: :json
          }.to change(Player, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
