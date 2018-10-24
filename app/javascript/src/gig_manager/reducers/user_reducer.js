import {
  USER_DATA_SUCCESS,
  USER_DATA_FAIL,
} from '../action_types/user_types';

const userReducer = (state = {}, action) => {
  switch (action.type) {
    case USER_DATA_SUCCESS:
      return action.payload;
    case USER_DATA_FAIL:
      return {
        ...state,
        error: action.payload,
      }
    default:
      return state;
  }
}

export default userReducer
