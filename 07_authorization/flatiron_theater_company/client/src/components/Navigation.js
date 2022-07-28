import { useState } from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { GiHamburgerMenu } from "react-icons/gi";

function Navigation({ currentUser, updateUser }) {
  const [menu, setMenu] = useState(false);

  const handleLogOut = () => {
    // DELETE `/logout`
    fetch('/logout', {
      method: 'DELETE'
    })
    updateUser(false)
  
  };

  return (
    <Nav>
      <NavH1>Flatiron Theater Company</NavH1>
      <Menu>
        {currentUser ? <button onClick={handleLogOut}>Log Out</button> : null}
        {!menu ? (
          <div onClick={() => setMenu(!menu)}>
            <GiHamburgerMenu size={30} />
          </div>
        ) : (
          <ul>
            <li onClick={() => setMenu(!menu)}>x</li>
            <li>
              {currentUser ? <Link to={`/users/${currentUser.id}`}>Account</Link> : null }
            </li>
            <li>
              <Link to="/users/new">Sign Up</Link>
            </li>
            <li>
              <Link to="/login">Login</Link>
            </li>
            <li>
              <Link to="/productions/new">New Production</Link>
            </li>
            <li>
              <Link to="/">Home</Link>
            </li>
          </ul>
        )}
      </Menu>
    </Nav>
  );
}

export default Navigation;

const NavH1 = styled.h1`
  font-family: "Splash", cursive;
`;
const Nav = styled.div`
  display: flex;
  justify-content: space-between;
`;

const Menu = styled.div`
  display: flex;
  align-items: center;
  a {
    text-decoration: none;
    color: white;
    font-family: Arial;
  }
  a:hover {
    color: pink;
  }
  ul {
    list-style: none;
  }
`;
