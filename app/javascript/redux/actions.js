export const setAuthToken = token => ({
  // TODO: Maybe I can move the ajax call to get the authentication token here instead of
  // requiring the actual token, so that payload would be email, password
  type: 'SET_AUTH_TOKEN',
  payload: token
})
