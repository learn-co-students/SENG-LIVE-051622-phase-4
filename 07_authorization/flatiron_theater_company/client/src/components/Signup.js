import React, {useState} from 'react'
import {useHistory} from 'react-router-dom'
import {Form} from '../styled/Form'

function SignUp({ updateUser }) {
    const [formData, setFormData] = useState({
        username:'',
        email:'',
        password:''
    })
    const [errors, setErrors] = useState([])
    const history = useHistory()

    const {username, email, password} = formData

    function onSubmit(e){
        e.preventDefault()
        const user = {
            username,
            email,
            password
        }
       
        fetch(`/users`,{
          method:'POST',
          headers:{'Content-Type': 'application/json'},
          body:JSON.stringify(user)
        })
        .then(res => {
            if(res.ok){
                res.json().then(user => {
                    updateUser(user)
                    history.push(`/users/${user.id}`)
                })
            }else {
                res.json().then(json => setErrors(Object.entries(json.errors)))
            }
        })
       
    }

    const handleChange = (e) => {
        const { name, value } = e.target
        setFormData({ ...formData, [name]: value })
      }
    return (
        <> 
        <Form onSubmit={onSubmit}>
        <label>
          Username
          </label>  
          <input type='text' name='username' value={username} onChange={handleChange} />
       
        <label>
         Email
         </label>
        <input type='text' name='email' value={email} onChange={handleChange} />
       
        <label>
         Password
         </label>
        <input type='password' name='password' value={password} onChange={handleChange} />
        
       
        <input type='submit' value='Sign up!' />
      </Form>
      {errors? errors.map(error => <div> {error[0]} {error[1]} </div>) :null}
        </>
    )
}

export default SignUp
