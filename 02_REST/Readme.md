# REST
## the SWBATs
- [ ] Recognize REST patterns including route & controller naming conventions
- [ ] Review how to create routes that match controller actions
- [ ] Observe how to create routes that match custom controller actions
- [ ] Observe how to create dynamic routes
- [ ] Explain the importance of params
- [ ] Observe how to access information from params
- [ ] Observe how to use Postman to test API without a front end client
- [ ]Observe how to write exceptions in controller actions
- [ ] Explain the purpose of strong params
- [ ] Recognize strong params pattern

## Deliverables 
- Review Rest   

| HTTP Verb 	|       Path       	| Controler#Action   	|
|-----------	|:----------------:	|--------------------	|
| GET       	|   /productions   	| productions#index  	|
| GET       	| /productions/:id 	| productions#show   	|
| POST      	|   /productions   	| productions#create 	|
| PATCH/PUT 	| /productions/:id 	| productions#update 	|
| DELETE    	| /productions/:id 	| productions#delete 	|



- Demo custom routes 
    - In the routes file, create a GET welcome route that directs to a welcome action in the productions controller
    - use rails routes to show the new route
    - render a message with the status of okay
    - test the route in the browser
- Demo dynamic routes 
    - In the routes file, create a GET welcome/:id route that directs to a welcome_show action in the productions controller
    - use rails routes to show the new route
    - Use debugging tools to observe the params
    - remove the debugging tool
    - render a message with the status of okay
    - test the route in the browser
- Demo resources
    - Add resources for productions in the routes file
    - use rails routes to show all of the routes
    - restrict routes using only
        - every time a new action is added, add the route 
- Demo Strong Params with Create
    - Use Postman to trigger the create action
    - In the Production controller, create action, use debugging tools to observe the params
    - Review mass assignment and why it can be dangerous and how rails prevent us from passing params as a single hash
    - Create strong params
    - Remove wrapped params
    - Create a Production using strong params 
    - render the production with the status of created
    - test route with Postman

- Demo Update
    - Use Postman to trigger an update action
    - In the Production controller update action, find and update the production with strong params
    - render the production with the status of accepted

- Demo Delete 
    - Use Postman to trigger a delete action
    - In the Production controller delete action, find and delete the production
    - set head to no_content 

