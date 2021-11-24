import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'

require("@popperjs/core")
import 'bootstrap/dist/js/bootstrap.js'
import 'bootstrap/dist/css/bootstrap.css'
import 'font-awesome/css/font-awesome.min.css'

import App from '../src/gig_manager/components/app'

document.addEventListener("DOMContentLoaded", function(event) {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
});

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <BrowserRouter basename="/backstage">
      <App />
    </BrowserRouter>,
    document.getElementById('gig-manager-container'),
  )
})
