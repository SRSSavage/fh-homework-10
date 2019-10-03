require 'rails_helper'

module API
  describe TeamsController, type: :request do
    describe 'GET /teams' do
      it 'retrieves all the requested team' do
        # arrange
        Team.create!(name: 'Tigers')

        # act
        get api_teams_url,
            as: :json

        # assert
        expect(response.status).to eq(200)
      end
    end

    describe 'GET /teams/:id' do
      context 'with valid params' do
        it 'retrieves the requested team' do
          # arrange
          team = Team.create!(name: 'Tigers')

          # act
          get api_team_url(team),
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'retrieves the requested team' do
          # arrange
          team_id = -1

          # act
          get api_team_url(team_id),
              as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'POST /teams' do
      context 'with valid params' do
        it 'creates a new Team' do
          # arrange
          team = Team.new(name: 'Tigers')

          # act / assert
          expect {
            post api_teams_url,
                 params: { team: team.attributes },
                 as: :json
          }.to change(Team, :count).by(1)

          # TODO: extract into another example
          expect(response.status).to eq(201)
        end
      end

      context 'with invalid params' do
        it 'creates a new team' do
          # arrange
          invalid_attributes = { name: '' }

          # act / assert
          expect {
            post api_teams_url,
                 params: { team: invalid_attributes },
                 as: :json
          }.to change(Team, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'PUT /teams/:id' do
      context 'with valid params' do
        it 'updates the requested team' do
          # arrange
          team = Team.create!(name: 'Tigers')
          new_attributes = { name: 'Pirates' }

          # act
          put api_team_url(team),
              params: { team: new_attributes },
              as: :json

          # assert
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'updates the requested team' do
          # arrange
          team = Team.create!(name: 'Tigers')
          invalid_attributes = { name: '' }

          # act
          patch api_team_url(team),
                params: { team: invalid_attributes },
                as: :json

          # assert
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'DELETE /teams/:id' do
      context 'with valid params' do
        it 'destroys the requested team' do
          # arrange
          team = Team.create!(name: 'Tigers')

          # act / assert
          expect {
            delete api_team_url(team),
                   as: :json
          }.to change(Team, :count).by(-1)

          # TODO: extract into another example
          expect(response.status).to eq(200)
        end
      end

      context 'with invalid params' do
        it 'destroys the requested team' do
          # arrange
          team_id = -1

          # act / assert
          expect {
            delete api_team_url(team_id),
                   as: :json
          }.to change(Team, :count).by(0)

          # TODO: extract into another example
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
