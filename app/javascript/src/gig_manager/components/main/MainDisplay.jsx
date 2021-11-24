import React from 'react'
import { Switch, Route } from 'react-router-dom'

import Dashboard from '../dashboard/dashboard'
import Musicians from '../musicians/musicians'
import Venues from '../venues/venues'
import Settings from '../settings/settings'


const MainDisplay = () => {
  return (
    <div>
      <Switch>
        <Route exact path='/' component={Dashboard} />
        <Route path='/musicians' component={Musicians} />
        <Route path='/venues' component={Venues} />
        <Route path='/settings' component={Settings} />
      </Switch>
    </div>
  )
}

export default MainDisplay
