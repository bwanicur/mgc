import React from 'react'
// import CollapseableNavigation from './navigation/collapseable_navigation'
import Navigation from './navigation/navigation'
import MainDisplay from './main/main_display'

import 'font-awesome/css/font-awesome.min.css';


// TODO for smaller displays: <CollapseableNavigation />
const App = () => (
  <div id="app-wrapper" className="ui container">
    <Navigation />
    <MainDisplay />
  </div>
)

export default App
