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
  }
}
