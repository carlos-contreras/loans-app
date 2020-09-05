// Ref: https://github.com/mui-org/material-ui/blob/master/docs/src/pages/getting-started/templates/sign-in-side/SignInSide.js

import React from 'react'
import { Route, Switch, Redirect } from 'react-router-dom'
import Container from '@material-ui/core/Container'
import SignIn from './SignIn'

export default function App() {
  return (
    <Container component="main" maxWidth="xs">
      <Switch>
        <Route
          exact
          path="/"
        >
          <Redirect to="/sign_in" />
        </Route>
        <Route exact path="/sign_in" component={SignIn} />
      </Switch>
    </Container>
  );
}