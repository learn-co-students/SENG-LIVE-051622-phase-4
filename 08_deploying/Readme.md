# Deploying
## SWBATs:
- [ ] Explain what it means to deploy an application
- [ ] Observe how to configure an application for deployment
- [ ] Observe how to deploy an application to heroku

## Heroku 
Heroku is a Platform as a Service (PaaS). It manages the hardware and environment we can use to host our application. Instead of hosting it locally, we can use Heroku's service to host our app on the web.

## Deliverables

- Demo Download Heroku 
    - To use Heroku, students will first need to make an account and install Heroku. ` brew tap heroku/brew && brew install heroku`
    
    - Heroku only supports specific versions of ruby. Of the versions it supports, we recommend 2.7.4

    ```
        rvm install 2.7.4 --default
        gem install bundler
        gem install rails
    ```

    - Using the terminal, log into Heroku. After running the command `heroku login`, heroku's authentication page should appear. Login as normal. 



- Demo Postgresql

    - Heroku requires Postgresql instead if SQLite
        - To Install PostgreSQL 

            ```
                brew install postgresql

                brew services start postgresql

            ```

- Demo hosting a rails app

    - To deploy rails/react app, we need to make sure the app is using PostgreSQL 

    - For a new app

        - `rails _6.1.4_ new pg-flatiron-theater --api --minimal --database=postgresql`
        
        - The following will configure our gemfile.lock to work with the same OS Heroku uses 
            - `bundle lock --add-platform x86_64-linux --add-platform ruby`

    - For an existing SQLight app, follow the steps front the heroku docs to convert the application to PostgreSQL [docs](https://devcenter.heroku.com/articles/sqlite3)

    - Note: If you are converting the application, be sure to run ` bundle lock --add-platform x86_64-linux --add-platform ruby` as well

- Demo Hosting React

    - Configure react to work in rails production.
    - `npm install --prefix client`
    - Create a Procfile in the root of your directory
    ```
        web: bundle exec rails s
        release: bin/rake db:migrate
    ```
    - Create a Procfile.dev in the root of your directory as well. This will allow you to run your app locally using Heroku
    ```
        web: PORT=4000 npm start --prefix client
        api: PORT=3000 bundle exec rails s
    ```
    - Create a static React APP that is served from rails
    - `npm run build --prefix client`
    - Move the static files to public which is used by rails to server static assets 
    - `mv client/build/* public`

    - Configure client side routing
        - Because we use client side routing we need to make sure the routes from our react app sill loads our components. 
        - The follwing will redirect routes client to our index.html 
        - route.rb
            - `get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }`

    - in the terminal run `rails g controller fallback_controller`
    
    - in app/controllers/fallback_controller.rb 
    ```
        class FallbackController < ActionController::Base
            def index
                render file: 'public/index.html'
            end
        end

    ```

- Demo Deploy to Heroku 
    - Add a package.json to the root of your rails app
    ```
        {
            "name": "heroku-deploy",
            "description": "Build scripts for Heroku",
            "engines": {
            "node": "15.6.0"
            },
            "scripts": {
            "clean": "rm -rf public",
            "build": "npm install --prefix client && npm run build --prefix client",
            "deploy": "cp -a client/build/. public/",
            "heroku-postbuild": "npm run clean && npm run build && npm run deploy"
            }
        }

    ```

    - In the terminal in the root of the application, run the following. 
    ```
        heroku create
        git add .
        git commit -m 'Initial commit'
    ```
    - Add the nodejs and ruby buildpacks for heroku's environment

    ```
        heroku buildpacks:add heroku/nodejs --index 1
        heroku buildpacks:add heroku/ruby --index 2
    ```

    - Push to heroku`git push heroku main`

    - seed and migrate `heroku run rails db:migrate db:seed`
    
    - open the heroku app `heroku open`

    - See the url that your app is being hosted at `git config --list --local | grep heroku`

    - run heroku locally `heroku local -f Procfile.dev`


