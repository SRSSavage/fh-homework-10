# Homework 10 - Building A Rails API using TDD

## Due Date

Thursday, September 12, 2019

## Goals

- The purpose of this homework is to build an API using TDD to support the
  following set of functionality:

  - creating player

  - updating player

  - showing player

  - list players

  - deleting player

Note: One only needs to implement the `PlayersController` for this assignment.

## Reading and Resources

Building a JSON API with Rails 5 - https://blog.codeship.com/building-a-json-api-with-rails-5

Using Rails for API-only Applications - http://edgeguides.rubyonrails.org/api_app.html

API Testing Client - https://www.getpostman.com

RSpec Request Specs - https://www.relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec

Ruby Language - http://www.ruby-lang.org/en/documentation/

Rails Guides - http://guides.rubyonrails.org/index.html

## API Reference

- request

  GET /api/players

- response body

  ```json
  [
      { id: 1,
        first_name: "Nora",
        last_name: "Renner",
        email: "durward@labadie.org",
        age: 22,
        position: "defensive midfielder"
      },
      ....
  ]
  ```

- response status

  - success - 200

- response format

  JSON

  Note: For each player instance, you only need to include id, first_name,
  last_name, email, age, position

- request

  POST /api/players

- params

  ```json
  {
    "first_name": "Bob",
    "last_name": "Smith",
    "email": "bobs@bobsmith.com",
    "age": 22,
    "position": "defensive midfielder"
  }
  ```

- response body

  ```json
  {
    "id": 51,
    "first_name": "Bob",
    "last_name": "Smith",
    "email": "bobs@bobsmith.com",
    "age": 22,
    "position": "defensive midfielder",
    "created_at": "2018-12-07T07:37:20.902Z",
    "updated_at": "2018-12-07T07:37:20.902Z"
  }
  ```

- response status

  - success - 201
  - failure - 422

- response format

  JSON

- request

  GET /api/players/:id

  e.g.

  GET /api/players/51

- response body

  ```json
  {
    "id": 51,
    "first_name": "Bob",
    "last_name": "Smith",
    "email": "bobs@bobsmith.com",
    "age": 22,
    "position": "defensive midfielder",
    "created_at": "2018-12-07T07:37:20.902Z",
    "updated_at": "2018-12-07T07:37:20.902Z"
  }
  ```

- response status

  - success - 200
  - failure - 422

- response format

  JSON

- request

  DELETE /api/players/:id

  e.g.

  DELETE /api/players/51

- response body

  ```json
  {
    "id": 51,
    "first_name": "Daniel",
    "last_name": "Smith",
    "email": "daniels@bobsmith.com",
    "age": 25,
    "position": "defensive midfielder",
    "created_at": "2018-12-07T07:37:20.902Z",
    "updated_at": "2018-12-07T07:47:58.466Z"
  }
  ```

- response status

  - success - 200
  - failure - 422

- response format

  JSON

- request

  PUT /api/players/:id

  e.g.

  PUT /api/players/51

  ```json
  {
    "first_name": "Daniel",
    "last_name": "Smith",
    "email": "daniels@bobsmith.com",
    "age": 25
  }
  ```

- response body

  ```json
  {
    "id": 51,
    "first_name": "Daniel",
    "last_name": "Smith",
    "email": "daniels@bobsmith.com",
    "age": 25,
    "position": "defensive midfielder",
    "created_at": "2018-12-07T07:37:20.902Z",
    "updated_at": "2018-12-07T07:47:58.466Z"
  }
  ```

- response status

  - success - 200
  - failure - 422

- response format

  JSON

## Player Model

- first_name - string

- last_name - string

- email - string

- age - integer

- position - string

  possible options for position

  - forward

  - right back

  - right midfielder

  - defensive midfielder

  - goalkeeper

  - striker

  - left midfielder

  - defensive midfielder

  - left back

  - stopper

  - sweeper

## Setup Rails API application

```bash
unzip fh-homework-AB-MM.DD.YYYY.zip
mv fh-homework-AB-MM.DD.YYYY fh-homework-AB
cd fh-homework-AB
git init
git add .
git commit -am 'Initial commit'
git checkout -b part-01-initial-api
```

Note: The solution for this homework should exist within the branch,
`part-01-initial-api`.

## Using TDD

You will be using RSpec request specs to test your API and your files for the
spec and implementation will reside in the following folders:

- spec folder

  ```bash
  spec/requests/api/players_controller_spec.rb
  ```

- implementation folder

  ```bash
  app/controllers/api/players_controller.rb
  ```

- running all specs

  ```
  $ bundle exec rspec
  ```

  Note: Do not type `$` in the above. Just the command that follows.

  You are done when the above command generates the similar output:

  ```bash
  $ bundle exec rspec
  .........

  Finished in 0.22576 seconds (files took 1.13 seconds to load)
  9 examples, 0 failures
  ```

- running a specific spec

  ```bash
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:6 # API::PlayersController GET /players retrieves all the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:25 # API::PlayersController GET /players/:id with valid params retrieves the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:43 # API::PlayersController GET /players/:id with invalid params retrieves the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:59 # API::PlayersController POST /players with valid params creates a new Player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:80 # API::PlayersController POST /players with invalid params creates a new player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:99 # API::PlayersController PUT /players/:id with valid params updates the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:119 # API::PlayersController PUT /players/:id with invalid params updates the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:141 # API::PlayersController DELETE /players/:id with valid params destroys the requested player
  bundle exec rspec ./spec/controllers/api/players_controller_spec.rb:161 # API::PlayersController DELETE /players/:id with invalid params destroys the requested player
  ```

## Generate Fake Data

- Use a Ruby gem called `faker` to generate 50 players

  - add the logic to your `seeds.rb` file for creating the player models

## Deliverables

- create Github repository called `fh-homework-10`

  Note: Follow the instructions for connecting your local repository to the Github repository.

- push changes to Github

  ```bash
  cd fh-homework-10
  git checkout part-01-initial-api
  git push
  ```

- merge changes into the master branch and push to Github

  ```bash
  cd fh-homework-10
  git checkout master
  git merge part-01-initial-api
  git push
  ```

- send me a link to your `part-01-initial-api` branch.

## Have Questions

Please make a reasonable effort to complete the homework prior to our next session. If you have any questions regarding this homework, please do send me a message via Slack.
