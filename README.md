# Robot World

## Overview

Robot World is a small application written in Ruby and Sinatra that supports basic CRUD functionality with a simple sqlite3 database. It allows a user to add robots to a database and then view information about them. Though it is written with Sintra, it is meant to mimic the structure of a Rails application.

The application uses the [chartkick gem](https://github.com/ankane/chartkick) for presenting interactive graphs and [prawn gem](https://github.com/prawnpdf/prawn) for creating simple PDFs. The application utilizes [capybara](https://github.com/jnicklas/capybara) and [minitest](https://github.com/seattlerb/minitest) for testing. The views are written in [haml](https://github.com/haml/haml) and utilize the [materialize](http://materializecss.com/) framework for styling.

## Getting Set Up

1. Clone the repository down to your local machine
2. Run the command `bundle` from the terminal to install all necessary gems
3. Start up the server with the command `shotgun` from the terminal
4. Visit the application at `localhost:9393`

## Running the tests

To run the full test suite which includes both feature tests and model tests, run the command `rake test` from the terminal while in the project's base directory.
