import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'

import App from '../src/gig_manager/components/app'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <BrowserRouter basename="/backstage">
      <App />
    </BrowserRouter>,
    document.getElementById('gig-manager-container'),
  )
})
