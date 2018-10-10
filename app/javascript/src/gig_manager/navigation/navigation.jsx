import React from 'react'
import { NavLink } from 'react-router-dom'
import { Icon, Menu } from 'semantic-ui-react'

const Navigation = () => (
  <div className="navigation-container">
    <Menu fluid widths={5}>
      <Menu.Item active={ null } >
        <NavLink to='/'>
            <Icon name="home" />
            Dashboard
        </NavLink>
      </Menu.Item>
      <Menu.Item active={ null } >
        <NavLink to='/musicians'>
            <Icon name="group" />
            Musicians
        </NavLink>
      </Menu.Item>
      <Menu.Item active={ null } >
        <NavLink to='/gigs'>
            <Icon name="music" />
            Gigs
        </NavLink>
      </Menu.Item>
      <Menu.Item active={ null } >
        <NavLink to='/settings'>
            <Icon name="setting" />
            Settings
        </NavLink>
      </Menu.Item>
      <Menu.Item active={ null } >
        <a href='/logout'>
          <Icon name="power" />
          Logout
        </a>
      </Menu.Item>
    </Menu>
  </div>
)

export default Navigation;
