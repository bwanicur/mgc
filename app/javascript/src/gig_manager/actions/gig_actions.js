import { GIG_DATA_SUCCESS } from '../action_types/gig_types';

export function gigsDataSuccess(data) {
  return { type: GIG_DATA_SUCCESS, payload: data };
}
