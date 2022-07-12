import { Route, Switch } from 'react-router-dom'
import {createGlobalStyle} from 'styled-components'
import {useEffect, useState} from 'react'
import Home from './components/Home'
import ProductionForm from './components/ProductionForm'
import Navigation from './components/Navigation'
import ProductionDetail from './components/ProductionDetail'

function App() {
  const [productions, setProductions] = useState([])
  const [errors, setErrors] = useState(false)


  useEffect(() => {
    //GET to '/productions'
    fetch('/productions')
    .then(res => {
      //res.ok reads the status of the response and will return if the status is within the 200 range. This can be used to report errors and render a message to the user. 
      if(res.ok){
        res.json().then(setProductions)
      }else {
        res.json().then(data => setErrors(data.error))
      }
    })
  },[])

  const addProduction = (production) => setProductions(current => [...current,production])
       

  if(errors) return <h1>{errors}</h1>

  return (
    <>
    <GlobalStyle />
    <Navigation/>
      <Switch>
      <Route exact path='/'>
        <Home  productions={productions}/>
      </Route>
      
      <Route exact path='/productions/new'>
        <ProductionForm addProduction={addProduction} errors={errors} />
      </Route>
      
      <Route exact path='/productions/:id'>
          <ProductionDetail />
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

