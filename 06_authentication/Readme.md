# Authentication
## SWBATs:
- [ ] Explain the difference between authentication and authorization
- [ ] Explain what sessions and cookies are
- [ ] Explain the importance of CORS
- [ ] Explain the purpose of bcrypt
- [ ] Observe how bcrypt is used to protect User data
- [ ] Observe how to configure CORS
- [ ] Observe a full-stack authentication workflow via sign up page

Users -< Tickets > Producitons 
![associations.png](assets/associations.png)

## Deliverables
- Review Authentication and password security with the following topics
	- Storing passwords in a plain text string
	- Bruit force attacks
	- Hashing
	- Rainbow Tables
	- Salting 

Note: adding BCrypt only takes a few lines of code; the following is to explain what is going on underneath the hood.

- Demo BCrypt
- Review the BCrypt docs https://github.com/bcrypt-ruby/bcrypt-ruby

`gem install bcrypt`

- Demo the following in the rails console
    - `cow1 = BCrypt::Password.create('cow')`
    - BCrypt creates an instance of a hashed password wehn given a string.
    -  The hash can be saved in the DB to identify the user later. 
    - `cow2 = BCrypt::Password.create('cow')`
    - `cow1 === cow2` #false
    - Even when given the same password, BCrypt produces a different hash. 


    - Compairing a BCrypt instance with the correct password returns true
    `cow1 == ‘cow’` #true

    - `==` in BCrypt is a method on the Password class for BCrypt. It might be easier to think of it more like this. 
    - cow1.==('cow')
    - BCyrpt docs https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/lib/bcrypt/password.rb
    ```
        # Compares a potential secret against the hash. Returns true if the secret is the original secret, false otherwise.	
        #  def ==(secret)
        #     super(BCrypt::Engine.hash_secret(secret, @salt))
        #  end
    ```
    - The hash is made of two parts salt and checksum
    - `cow1.checksum`
    - `cow1.salt`
    - If BCrypt is given the exact string and the same salt, it will produce the same hash. BCrypt can compare a user's input with the hash saved in the database.
    - `cow3 = BCrypt::Engine::hash_secret('cow', cow1.salt)`
    - `cow1 ==  cow3 #true`

- Demo adding BCrypt to a project
    - Create a migration to change password to password_digest
    - Add has_secure_password to the User model
    - Re-seed and check your passwords in the rails console `User.first.password_digest`
        - Notice that the password attribute in User.create didn't need to be update to `password_digest`. Password doesn't correspond to database column. Instead, Bcyrpt will hash the password and save it to the password_digest column.
    - You can imagin if we built the functionality ourself it would look something like this:
    ```
        def password=(new_password)
            alt = BCrypt::Engine::generate_salt
            self.password_digest = BCrypt::Engine::hash_secret(new_password, salt)
        end
    ```

    - Add the create route to users in routes.rb
    - Add a create action in the Users controller
    - Test the route with the client's SignUp component. If the response is sucessful, the client should direct to the UsersPage. 
    - Verify the password is hashed in the rails console 








Images:
landingPageImage
https://unsplash.com/photos/POd35V_uE4k
Published on February 16, 2018
Free to use under the Unsplash License
Dancer: Olivia Tarchick