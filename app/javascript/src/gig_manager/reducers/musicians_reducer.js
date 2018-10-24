import {
  MUSICIAN_DATA_SUCCESS,
  MUSICIAN_DATA_FAIL,
} from '../action_types/musician_types';

const musiciansReducer = (state = [], action) => {
  switch (action.type) {
    case MUSICIAN_DATA_SUCCESS:
      return action.payload;
    case MUSICIAN_DATA_FAIL:
      return {
        ...state,
        error: action.payload,
      }
    default:
      return state;
  }
}

export default musiciansReducer
