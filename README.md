# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

### TODOS

- Import material UI CSS using the js package
- Implement main list of loans
- Implement details modal for a loan
- Implement payment feature using stripe, payment button for loan payment
- Implement webhook endpoint to receive stripe updates
- User https://ngrok.com/ to test stripe webhook with updates related to payments
- Add database seeds to create initial users and loans, payments and updates

### HOW TO RUN THE PROJECT
- set ruby version to 2.7.1
- `bundle install`
- `bundle exec rails db:setup`
- `bundle exec rails s`