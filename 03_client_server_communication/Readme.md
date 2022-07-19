# Client Server Communication
## SWBATs:
- [ ] Observe how to connect a React client and API
- [ ] Observe how to create a new instance from client
- [ ] Observe how to fetch data from client
- [ ] Observe how to use built-in Active Record validations to protect data in controller actions
- [ ] Observe how to handle errors in controller actions
- [ ] Explain the purpose of strong params
- [ ] Recognize strong params pattern

## deliverables
- Demo client-server communication 
    - Review the client folder, and the application built so far.
    -  Review the package.json and the proxy for "http://localhost:3000"

    - In the App component, in the useEffect hook, add a GET request to '/productions' that will set productions to state if the request is returned successfully.

    - Add a debugging tool to the production controller's index action to confirm that the fetch call triggers the controller action.

- Demo error handling for GET requests

    - Review res.ok https://developer.mozilla.org/en-US/docs/Web/API/Response/ok

    - Add some error handling for an unsuccessful response. Refactor the fetch request to verify that the response has returned successfully before setting the state. 
    ```
    if(res.ok){
            res.json().then(setProductions)
        }
    ```
    - Add errors to state  `const [errors, setErrors] = useState(false)`

    - Add a conditional above the return statement. If errors, render an h1 containing the errors `if(errors) return <h1>{errors}</h1>`

    - Add an else to the res.ok if statement that will set the errors to state if the response returns unsuccessfully.
    ```
    else {
            res.json().then(data => setErrors(data.error))
        }

    ```

    - Test the else condition by commenting out the index route in routes.rb to force the client to throw an error. 

    - In the ProductionDetail component, make a GET request to '/productions/:id'

    - Following the same pattern from APP, set the Production to state if the request is successful and set the errors if the request fails. Add a conditional to render errors if they exist.

    - Test the else condition by commenting out the show route in routes.rb to force the client to throw an error. 

- Demo Validations 
    - Review the rails validation docs https://guides.rubyonrails.org/active_record_validations.html

    - Add a few validations, such as validating the presence of title and that the budget is greater than 0.

    - Bonus: add a custom validation

- Demo handling invalid records 

    - In the Production, controller handle validation in 3 ways. 
    
    1. .valid
        - In the create action, add a condition after Production.create. If  `production.valid?` send the Production in a response with the created status. Else send the errors with Production.errors.full_messages and a status of unprocessable_entity.
    
        - Use postman to verify the validation.
    
    2. rescue 
        - Review exceptions https://ruby-doc.org/core-2.6/Exception.html

        - Add a ! to create to raise an exception.

        - Send the Production in a response with the status of create 

        - Add a rescue that will trigger if an exception is raised.

        - Test the rescue with Postman and use a debugging tool to dig into the invalid to view the errors. 
        ```
        rescue ActiveRecord::RecordInvalid => invalid
            render json: { errors: invalid.record.errors }, status: :unprocessable_entity
        ```
    3. rescue_from
        - Create a private method called render_unprocessable_entity with the parameter of invalid that will create a response with errors and a status of unprocessable_entity
        ```
            def render_unprocessable_entity(invalid)
                render json: {errors: invalid.record.errors}, status: :unprocessable_entity
            end
	    ```
        - Add a rescue_from to the top of the controller that will trigger on a RecordInvalid exception and invoke render_unprocessable_entity
        ```
            rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
        ```

Images:
landingPageImage
https://unsplash.com/photos/POd35V_uE4k
Published on February 16, 2018
Free to use under the Unsplash License
Dancer: Olivia Tarchick