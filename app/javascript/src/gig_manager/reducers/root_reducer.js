import { combineReducers } from 'redux'
import gigs from './gigs_reducer'
import musicians from './musicians_reducer'
import user from './user_reducer'

const rootReducer = combineReducers({
  user,
  gigs,
  musicians,
})

export default rootReducer
