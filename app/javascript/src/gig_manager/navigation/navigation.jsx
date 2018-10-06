import React from 'react'
import { NavLink } from 'react-router-dom'

const Navigation = () => (
  <div>
    <NavLink to='/' activeClassName='active'>Dashboard</NavLink>
    <NavLink to='/musicians' activeClassName='active'>Musicians</NavLink>
    <NavLink to='/gigs' activeClassName='active'>Gigs</NavLink>
    <NavLink to='/logout'>Log Out</NavLink>
  </div>
)

export default Navigation;
