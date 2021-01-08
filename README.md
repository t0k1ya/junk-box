# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    - 2.6.3
* installation
1. clone docker-rails repository
    ````
    $ git clone https://github.com/t0k1ya/docker_rails.git
    ````
2. clone this repository in docker-rails
    ```
    $ cd docker_rails
    $ git clone https://github.com/t0k1ya/junk-box.git
    $ mv junk-box src
    ```
3. start project
    ```
    $ docker-compose up
    ```

4. db migration
    ```
    $ docker-compose run app rails db:migrate:reset
    ```

