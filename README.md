## Google Books CLI
- A command line application that allows you to use the Google Books API to search for books and construct a reading list.

## Technologies Utilized:
- Ruby
- SQLite w/ activerecord

## Installation
- fork and clone repo
- cd into cli-books-app
- bundle install

## How to run the application
- cd into cli-books-app
- $ ruby bin/run.rb
- login or create account
- search for books
- view reading list
- log off

## How to run the test
- rspec

## File structure

1. apps/models - domain models files
2. bin - run.rb file to run the application
3. config - environment setup
4. db - database for application, schema & seeds file
5. lib - cli.rb (command line prompts)
6. Rakefile
7. Gemfile
8. README.md

## API Reference
- Google Books APIs
- https://developers.google.com/books/docs/v1/using

Created by: James Sapp