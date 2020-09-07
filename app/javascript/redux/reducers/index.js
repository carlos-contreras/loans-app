import { combineReducers } from "redux"
import currentUser from "./currentUser";
// TODO: I need reducers for payments, loans, paymentUpdates, loansUpdates

export default combineReducers({ currentUser });
