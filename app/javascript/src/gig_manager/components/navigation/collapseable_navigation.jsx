import React from 'react'
import { Link } from 'react-router-dom'
import {
  Collapse,
  Navbar,
  NavbarToggler,
  NavbarBrand,
  Nav,
  NavItem,
  NavLink,
} from 'reactstrap';

class CollapseableNavigation extends React.Component {
  state = {
    isOpen: true,
  }

  toggle = () => {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }

  render() {
    return (
      <div>
        <Navbar color="faded" light>
          <NavbarBrand tag={Link} to="/" className="mr-auto">MGC</NavbarBrand>
          <NavbarToggler onClick={this.toggle} />
          <Collapse isOpen={this.state.isOpen} navbar>
            <Nav navbar>
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
          </Collapse>
        </Navbar>
      </div>
    );
  }
}

export default CollapseableNavigation;
