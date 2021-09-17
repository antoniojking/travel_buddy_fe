[![untitled.png](https://i.postimg.cc/t46wNSzd/untitled.png)](https://postimg.cc/k2nTnyzD)
## Travel Buddy -(front end)

[Deployed to Heroku](https://travel-buddy-turing.herokuapp.com/)

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
# Welcome to Travel Buddy
  - The frustrating part about planning a trip with friends is keeping track of all the details. Wouldn’t it be easier if all the details were in one place for all to see? Travel Buddies makes it easy to organize a trip while keeping everyone involved on the same page.
<p align="center">
  <img src="place holder"/>
</p>

<p align="center">
  <img src="Place Holder"/>
</p>

<!-- ![Relational Rails Welcome Screen](https://user-images.githubusercontent.com/74567704/124805908-1e01ff80-df2a-11eb-92bc-3a1536aa9c84.png) -->

## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#tools-used)
- [Pages](#pages)
    - [Login Page](#login)
- [Contributing](#contributors)

# README
------

### <ins>Overview</ins>

[Travel Buddy](https://github.com/antoniojking/travel_buddy_fe) is a 10 day, 6 person project. The idea was to build a web application that allows users to connect and plan trips to national parks. 

- Apply principles of flow control across multiple methods
- Design a one to many relationship using an API backend application
- Design a many to many relationship using an API backend application
- Design self referential relationship using an API backend application
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Use Rails to allow users to connect with other users
- Create instance and class methods on a Rails model
- Write model and feature tests that fully cover data logic and potential user behavior

[Technical Requirements](https://github.com/turingschool-examples/little-esty-shop/blob/main/doc/user_stories.md)

### <ins>Tools Used</ins>
- Ruby 2.7.2
- Rails 5.2.6
- PostgresQL
- Postico
- Capybara
- Launchy
- Orderly
- SimpleCov
- Git/GitHub
- HTML
- CSS
- Bootstrap
- RSpec
- Pry
- Atom
- VS Code
- Travis CI
- API
- RuboCop

### Pages 

#### Login
- Implement Spotify Oauth for users to login and store their data


### <ins>Contributors</ins>

👤  **Antonio King**
- Github: [Antonio King](https://github.com/antoniojking)
- LinkedIn: [Antonio Sweet](https://www.linkedin.com/in/antoniojking/)

👤  **Elliot Olbright**
- Github: [Elliot Olbright](https://github.com/ElliotOlbright)
- LinkedIn: [Elliot Olbright](https://www.linkedin.com/in/elliotolbright/)

👤  **Carina Sweet**
- Github: [Carina Sweet](https://github.com/chsweet)
- LinkedIn: [Carina Sweet](https://www.linkedin.com/in/carina-h-sweet/)

👤  **Michael Abbott**
- Github: [Michael Abbott](https://github.com/AbbottMichael)
- LinkedIn: [Michael Abbott](https://www.linkedin.com/in/mjabbottdesign/)

👤  **Matt Kragen**
- Github: [Matt Kragen](https://github.com/InOmn1aParatus)
- LinkedIn: [Matt Kragen](https://www.linkedin.com/in/mattkragen/)

👤  **Matt Toensing**
- Github: [Matt Toensing](https://github.com/matttoensing)
- LinkedIn: [Matt Toensing](https://www.linkedin.com/in/matt-toensing/)




<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/antoniojking/travel_buddy_fe.svg?style=flat-square
[contributors-url]: https://github.com/antoniojking/travel_buddy_fe/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/antoniojking/travel_buddy_fe.svg?style=flat-square
[forks-url]: https://github.com/antoniojking/travel_buddy_fe/network/members
[stars-shield]: https://img.shields.io/github/stars/antoniojking/travel_buddy_fe.svg?style=flat-square
[stars-url]: https://github.comantoniojking/travel_buddy_fe/stargazers
[issues-shield]: https://img.shields.io/github/issues/antoniojking/travel_buddy_fe.svg?style=flat-square
[issues-url]: https://github.com/antoniojking/travel_buddy_fe/issues
<!--


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

* ... -->


# Travel buddy

## Background and Description

"Travel Buddy" brings planning, communication and memories together in one place between multiple people..

## Requirements
- must use Rails 5.2.x
- must use PostgreSQL
- all code must be tested via feature tests and model tests, respectively
- must use GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- must include a thorough README to describe the project
- must deploy completed code to Heroku

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)



#### Project Configurations

* Ruby version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System dependencies](https://github.com/antoniojking/travel_buddy_fe/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'little_esty_shop_development'
    Created database 'little_esty_shop_test'
    ```

* How to run the test suite
    ```bash
    $ bundle exec rspec
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop

    ```

* [Heroku Deployment](https://agile-ravine-84109.herokuapp.com/), for production
