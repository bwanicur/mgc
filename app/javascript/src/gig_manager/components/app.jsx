import React from 'react'
import CollapseableNavigation from './navigation/CollapseableNavigation'
import MainDisplay from './main/MainDisplay'

const App = () => (
  <div id="app-wrapper" className="container-fluid">
    <CollapseableNavigation />
    <MainDisplay />
  </div>
)

export default App
