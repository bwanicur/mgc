import axios from 'axios';
import {
  INITIAL_DATA_FAIL,
  USER_DATA_SUCCESS,
} from '../action_types/user_types';
import { gigsDataSuccess } from './gig_actions';
import { musiciansDataSuccess } from './musician_actions';

function initialDataFail(error) {
  return { type: INITIAL_DATA_FAIL, payload: { error } };
}

function userDataSuccess(data) {
  return { type: USER_DATA_SUCCESS, payload: data }
}

export function fetchInitialData() {
  return dispatch => axios.get('/backstage/api/user')
    .then((res) => {
      // TODO: if(getState().lastRequestedAt)
      // not sure if we will need conditional here - hopefully
      // the dashboard container component will not re-render too often
      dispatch(userDataSuccess(res.data.user));
      dispatch(gigsDataSuccess(res.data.gigs));
      dispatch(musiciansDataSuccess(res.data.musicians));
    })
    .catch((error) => {
      dispatch(initialDataFail(error));
    })
}
