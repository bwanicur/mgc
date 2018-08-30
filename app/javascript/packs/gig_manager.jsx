import React from 'react'
import ReactDOM from 'react-dom'
// import PropTypes from 'prop-types'
import { BrowserRouter } from 'react-router-dom'
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import App from '../src/gig_manager/app'

// problematic importing the CSS in our *.sass files
import 'semantic-ui-css/semantic.css'

import rootReducer from '../src/gig_manager/reducers'

const store = createStore(rootReducer)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>,
    document.getElementById('gig-manager-container'),
  )
})
