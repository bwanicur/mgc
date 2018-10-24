import {
  GIG_DATA_SUCCESS,
  GIG_DATA_FAIL,
} from '../action_types/gig_types';

const gigsReducer = (state = [], action) => {
  switch (action.type) {
    case GIG_DATA_SUCCESS:
      return action.payload;
    case GIG_DATA_FAIL:
      return {
        ...state,
        error: action.payload,
      }
    default:
      return state;
  }
}

export default gigsReducer
