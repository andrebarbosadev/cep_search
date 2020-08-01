# CEP Search API

Search for address using CEP code from Brazil. Based on cep.la/cep

API developed using Ruby (2.7.0) and the following tools:
* Rails (6.0.3.2)
* Ubuntu 20.04 LTS
* jwt
* httparty
* rspec
* faker
* shoulda matchers
* factory_bot_rails

To run, git clone the project and then on project folder you must run the following commands:
- bundle
- rails db:create
- rails db:migrate

To run the application use the following command:
- rails s -b 0.0.0.0
- access localhost:3000/<endpoint> on API request tool or browser

The make ease the use of the API requests you can use Insomnia or Postman.

A Postman file is located on the project root dir.

## Endpoints:

- POST /users/create (name, email, username, password, password_confirmation)
- POST /auth/login (email, password)
- GET /cep/:cep (must be authenticated)
- GET /history (must be authenticated)
