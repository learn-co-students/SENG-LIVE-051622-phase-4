# Intro to Rails
## SWBATs
- [ ] Review MVC
- [ ] Review route writing
- [ ] Review creating a controller action
- [ ] Explain what status codes are and why we use them
- [ ] Observe how to use rails generators to accomplish certain tasks
- [ ] Observe how to create migration files and migrate using rails generators
- [ ] Observe how to seed a database
- [ ] Observe how to call Class methods in controller actions
- [ ] Observe how to structure a json response
- [ ] Observe how to return status codes

## Deliverables

Flatiron Theater Company has hired us to build a web app. The app will have Users and Admin accounts. The theater's productions will be viewable to the general public, and users will be able to purchase tickets. 

Review MVC

![production image here](./assets/MVC.png)   

Creating a rails app:
```rb
rails _6.1.4_ new flatiron-theater --api --minimal -T
``` 

This will create a Rails application using version 6.

Lets explore the file structure of the app and important files and folders.

Rails generators: 
- `rails g`
- `rails g migration`
- `rails g model`
- `rails g controller`
- `rails g resource`
- `rails g scaffold`

Create a migration model and controller for production using the information from following image for reference:

![production image here](./assets/production.png)

Two ways to do this:

1. Run each generator as a standalone:

```rb
rails g model production title genre description:text budget:float image director ongoing:boolean
```

Will produce the model and migration 

```rb 
rails g controller production
```

2. Using the resource generator:

```rb
rails g resource production title genre description:text budget:float image director ongoing:boolean
``` 

This will produce a model, migration, controller and more!

Demo seeds
- Migrate and create production seeds

Demo rails routes 
- Create a custom route 
```rb
get "/productions", to: "productions#index"
```
Inside the terminal, run:

```bash 
rails routes
``` 

Can also be specific about which routes to output:

```bash 
rails routes | grep production
``` 

- review output of `rails routes` 

Demo controller actions 
- Create an index controller action.
	- Access the model with Production.all
	- render the productions in json
	- add a status of ok

```rb
class ProductionsController < ApplicationController
    def index 
        render json: Production.all, status: :ok
    end 
end

```
Start the server with:

```bash 
rails s
```
Confirm index route is working in the browser by navigating to `/productions` endpoint




