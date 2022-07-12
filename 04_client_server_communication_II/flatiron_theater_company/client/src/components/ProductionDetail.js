import  { Link, useParams, useHistory } from 'react-router-dom'
import {useEffect, useState} from 'react'
import styled from 'styled-components'

function ProductionDetail({deleteProduction}) {
  const [production, setProduction] = useState({crew_members:[], performers_and_roles:[]})
  const [errors, setErrors] = useState(false)
  
  const params = useParams()
  const history = useHistory()
  useEffect(()=>{
    //GET to '/productions/:id'
    fetch(`/productions/${params.id}`)
    .then(res => { 
      if(res.ok){
        res.json().then(data => setProduction(data))
      } else {
        res.json().then(data => setErrors(data.error))
      }
    })
  },[])

  function handleDelete(){
    //DELETE to `/productions/${params.id}`
    fetch(`/productions/${params.id}`,{
      method:'DELETE',
      headers: {'Content-Type': 'application/json'}
    })
    .then(res => {
      if(res.ok){
        deleteProduction(id)
        history.push('/')
      } else {
        res.json().then(data => setErrors(Object.entries(data.errors).map(e => `${e[0]} ${e[1]}`)))
      }
    })
  }
  

  if(errors) return <h1>{errors}</h1>
  const {id, title, budget, genre, image,description} = production 
  //Place holder data, will be replaced in the assosiations lecture. 
  const crew_members = ['Lily-Mai Harding', 'Cathy Luna', 'Tiernan Daugherty', 'Giselle Nava', 'Alister Wallis', 'Aishah Rowland', 'Keiren Bernal', 'Aqsa Parrish', 'Daanyal Laing', 'Hollie Haas']
  return (
      <CardDetail>
        <h1>{title}</h1>
          <div className='wrapper'>
            <div>
              <h3>Genre:</h3>
              <p>{genre}</p>
              <h3>Description:</h3>
              <p>{description}</p>
              <h2>Crew Memebers</h2>
              <ul>
                {crew_members.map(crew => <li>{crew}</li>)}
              </ul>
            </div>
            <img src={image}/>
          </div>
      <button><Link to={`/productions/${id}/edit`}>Edit Production</Link></button>
      <button onClick={handleDelete}>Delete Production</button>
      <button >Buy Ticket</button>
      </CardDetail>
    )
  }
  
  export default ProductionDetail
  const CardDetail = styled.li`
    display:flex;
    flex-direction:column;
    justify-content:start;
    font-family:Arial, sans-serif;
    margin:5px;
    h1{
      font-size:60px;
      border-bottom:solid;
      border-color:#42ddf5;
    }
    .wrapper{
      display:flex;
      div{
        margin:10px;
      }
    }
    img{
      width: 300px;
    }
    button{
      background-color:#42ddf5;
      color: white;
      height:40px;
      font-family:Arial;
      font-size:30px;
      margin-top:10px;
    }
  `