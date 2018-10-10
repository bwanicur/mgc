import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import createBrowserHistory from 'history/createBrowserHistory'
import { createStore } from 'redux'
import { Provider } from 'react-redux'

import App from '../src/gig_manager/app'

// problematic importing the CSS in our *.sass files
import 'semantic-ui-css/semantic.min.css'

import rootReducer from '../src/gig_manager/reducers'

const store = createStore(rootReducer)
const history = createBrowserHistory()

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <BrowserRouter history={history} basename="/backstage">
        <App />
      </BrowserRouter>
    </Provider>,
    document.getElementById('gig-manager-container'),
  )
})
