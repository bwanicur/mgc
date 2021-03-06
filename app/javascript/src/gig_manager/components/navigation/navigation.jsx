import React from 'react'
import { Link } from 'react-router-dom'
import {
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
} from 'reactstrap';

class Navigation extends React.Component {
  render() {
    return (
      <div>
        <Navbar color="light" light expand="md">
          <NavbarBrand tag={Link} to="/">MGC</NavbarBrand>
          <NavbarToggler onClick={this.toggle} />
            <Nav className="ml-auto" navbar>
              <NavItem>
                <NavLink tag={Link} to="/gigs">Gigs</NavLink>
              </NavItem>
              <NavItem>
                <NavLink tag={Link} to="/musicians">Musicians</NavLink>
              </NavItem>
              <NavItem>
                <NavLink tag={Link} to="/settings">Settings</NavLink>
              </NavItem>
            </Nav>
        </Navbar>
      </div>
    )
  }
}
export default Navigation
