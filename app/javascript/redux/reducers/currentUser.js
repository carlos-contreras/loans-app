const initialState = { authToken: null }

export default (state = initialState, action) => {
  switch (action.type) {
    case 'SET_AUTH_TOKEN':
      return {
        ...state,
        authToken: action.payload,
      };
    default:
      return state;
    // TODO: As part of this reducer I also need to fill other data related to the user
    // such as name and the role
  }
}
