# README

* Ruby version
    - 2.6.3
### インストール & 起動
1. clone docker-rails repository
    ````
    $ git clone https://github.com/t0rkie/rails_env
    ````
2. clone this repository in docker-rails
    ```
    $ cd docker_rails
    $ git clone https://github.com/t0rkie/junk-box.git
    $ mv junk-box src
    ```

3. db migration
    ```
    $ docker-compose run app rails db:migrate:reset
    ```

3. fetch some modules
    ```
    $ docker-compose run app bundle install
    $ docker-compose run app yarn install
    ```

4. start project
    ```
    $ docker-compose up
    ```

### productionモードで起動
1. create db for production
    ```
    $ docker-compose run app rails  db:setup RAILS_ENV=production
    ```
2. db migration
    ```
    $ docker-compose -f docker-compose.prd.yml exec app rails db:create
    $ docker-compose -f docker-compose.prd.yml run app rails db:migrate
    ```
3. start project
    ```
    // アセットのプリコンパイル
    $ docker-compose run app  bundle exec rake assets:precompile RAILS_ENV=production 
    $ docker-compose -f docker-compose.prd.yml up --build
    ```


### memo

* reactコンポーネントの作成
1. コンポーネント生成
```
// コンポーネント/ファイル名 props:型
$ rails g react:component HelloWorld greeting:string
```
2. 読み込み
```
// 任意の箇所で読み込める
<%= react_component('HelloWorld', greeting: 'Hello') %>
```