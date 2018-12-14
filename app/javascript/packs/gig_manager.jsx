import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux'
import thunk from 'redux-thunk'
import 'bootstrap/dist/css/bootstrap.css';

import rootReducer from '../src/gig_manager/reducers/root_reducer'
import App from '../src/gig_manager/components/app'

const store = createStore(
  rootReducer,
  applyMiddleware(thunk),
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <BrowserRouter basename="/backstage">
        <App />
      </BrowserRouter>
    </Provider>,
    document.getElementById('gig-manager-container'),
  )
})
