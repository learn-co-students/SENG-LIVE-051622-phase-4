import { Route, Switch } from 'react-router-dom'
import {createGlobalStyle} from 'styled-components'
import {useEffect, useState} from 'react'
import Home from './components/Home'
import ProductionForm from './components/ProductionForm'
import EditProductionForm from './components/EditProductionForm'
import Navigation from './components/Navigation'
import ProductionDetail from './components/ProductionDetail'
import UserPage from './components/UserPage'
import SignUp from './components/Signup'
import Login from './components/Login'
import NotFound from './components/NotFound'

function App() {
  const [productions, setProductions] = useState([])
  const [errors, setErrors] = useState(false)
  const [currentUser, setCurrentUser] = useState(false)

  useEffect(() => {
    fetchProductions()
  },[])

  const fetchProductions = () => {
    fetch('/productions')
    .then(res => {
      if(res.ok){
        res.json().then(setProductions)
      }else {
        res.json().then(data => setErrors(data.error))
      }
    })
  }

  console.log(currentUser)

  const addProduction = (production) => setProductions(current => [...current,production])

  const updateProduction = (updatedProduction) => setProductions(current => {
    return current.map(production => {
     if(production.id === updatedProduction.id){
       return updatedProduction
     } else {
       return production
     }
    })
  })

  const deleteProduction = (id) => setProductions(current => current.filter(p => p.id !== id)) 
  const updateUser = (user) => setCurrentUser(user)

  if(errors) return <h1>{errors}</h1>


  return (
    <>
    <GlobalStyle />
    <Navigation currentUser={currentUser} updateUser={updateUser}/>
      <Switch>

      <Route  path='/productions/new'>
        <ProductionForm addProduction={addProduction}/>
      </Route>
      <Route  path='/productions/:id/edit'>
        <EditProductionForm updateProduction={updateProduction}/>
      </Route>
     
      <Route path='/productions/:id'>
          <ProductionDetail deleteProduction={deleteProduction}/>
      </Route>

      <Route path='/users/new'>
        <SignUp updateUser={updateUser}/>
      </Route>

      <Route path='/users/:id'>
        <UserPage updateUser={updateUser}/>
      </Route>

      <Route path='/login' >
        <Login updateUser={updateUser}/>
      </Route>

    
      <Route exact path='/'>
        <Home productions={productions}/>
      </Route>

      <Route>
        <NotFound />
      </Route>
      
      </Switch>
    </>
  )
}

export default App

const GlobalStyle = createGlobalStyle`
    body{
      background-color: black; 
      color:white;
    }
    `

