import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from "react-redux";
import { HashRouter, Route } from 'react-router-dom'
import App from '../components/App'
import store from "../redux/store"

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <HashRouter>
        <Route path="/" component={App} />
      </HashRouter>
    </Provider>,
    document.body.appendChild(document.createElement('div')),
  )
})
