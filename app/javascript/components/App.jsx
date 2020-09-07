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
        {/*
          TODO: here I will add route for /home that will render the LoanList component
          that component will list the loans related to the current user if the currentUser has the
          'customer' rol, if the currentUser has the role 'admin' then will list all loans.
          This component will provide a table with filters and also a column for actions

          - Customers will have "Payment" button for the loans if loan payment is ready, that button
            will display the component with Stripe integration to allow the user to pay for the loan,
            as well as "Details" to open a modal with loan details and history button that
            will display a modal with the complete list of payments and if user clicks on a
            payment the modal will change to display the details of that specific payment

          - Admins will have and "Edit" button for posting updates to a loan, they also will have
            the same "Details" button that users have
        */}
      </Switch>
    </Container>
  );
}