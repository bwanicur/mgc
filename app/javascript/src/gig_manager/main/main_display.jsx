import React from 'react'
import { Switch, Route } from 'react-router-dom'
import Dashboard from '../dashboard/dashboard'
import Musicians from '../musicians/musicians'
import Gigs from '../gigs/gigs'
import Settings from '../settings/settings'

const MainDisplay = () => (
  <div>
    <Switch>
      <Route exact path='/' component={Dashboard} />
      <Route path='/musicians' component={Musicians} />
      <Route path='/gigs' component={Gigs} />
      <Route path='/settings' component={Settings} />
    </Switch>
  </div>
)

export default MainDisplay
