import { combineReducers } from 'redux'
import gigsReducer from './gigs_reducer'
import musiciansReducer from './musicians_reducer'

const rootReducer = combineReducers({
  gigsReducer,
  musiciansReducer,
})

export default rootReducer
