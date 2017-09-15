TrueLinkChallenge
=======================
## Synopsis


## Technologies and Tools Used

- Language: Ruby, JavaScript
- Framework: Rails, React
- Database: Active Record, PostgreSQL
- Testing: Rspec, Jest, Enzyme
- Other:

* versions
- Ruby 2.4.1
- Rails 5.1.3
- node 6.11

## How to run
- On command line in root folder
```
bundle install
cd && yarn
cd ..
```
- Create database and seed data
```
rake db:create db:migrate
```
- run both the server and the client
```
rake start
```
- http://localhost:3000/ for site
- http://localhost:3001/api for api

## How to run the test suites
- Rails tests in root folder
```
rspec
```
- React tests
```
cd client && yarn test
```
## Notes
- Initialized from my own Rails/React/Redux boilerplate


