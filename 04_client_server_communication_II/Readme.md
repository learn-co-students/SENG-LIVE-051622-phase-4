# Client Server Communication
## SWBATs:
- [ ] Observe fetching from client to show route and displaying a show page
- [ ] Observe sending a PATCH request from React client
- [ ] Observe sending a DELETE request from React client
- [ ] Observe how to handle exceptions in controller actions
- [ ] Review strong params
- [ ] Review Active Record validations
- [ ] Review error handling


## Deliverables
- Review why strong parameters are essential. 

- Demo Post
    - In the client, under the ProductionForm component, create a POST request on submit that sends a production to '/productions'

    - Use a conditional with res.ok. If the response is successful set productions to state and use history.push to direct to the show route of the new production. 
    - Else set errors to state. 

    - Handling InvalidRecord errors will be a little different due to the number of errors that are returned with the failed validations. Set the errors so that they include the attribute and the error message. 
    
    - Add a condition under the form; if errors, map through the errors in state and render them in JSX. These errors will inform the Users that their submission failed and why.
    
    - Test the validations and error handling using the form
    
- Demo PATCH
    - In the EditProductionForm component, add a PATCH request  '/productions/:id’ on submit. Add the same error handling from ProductionForm to the  EditProductionForm component.

    - To test these errors, and an exception will need to be raised from the request. 
    - In the Production controller, under the update action add ! to update. This will cause it to raise a RecordInvalid exception. 

    - An update request may raise another kind of exception if the record can not be located. Producion.find raises a RecordNotFound exception. 

    - Add a new rescue_from at the top of the controller that will invoke a method called `render_not_found` that takes an error as a parameter and will send a response with the not found error. 

    ```
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


        def render_not_found(error)
            render json: {errors: {error.model => "Not Found"}}, status: :not_found
        end
    ```
    - Test the validations and error handling using the form

- Demo Delete
    - In the ProductionDetail component, add a delete request on click of the delete button to  '/productions/:id’. Create a condition with res.ok. If the request is successfully removed the production from state and use history.push to direct to the home route.

    - Else set errors to state and render them. 





Images:
landingPageImage
https://unsplash.com/photos/POd35V_uE4k
Published on February 16, 2018
Free to use under the Unsplash License
Dancer: Olivia Tarchick