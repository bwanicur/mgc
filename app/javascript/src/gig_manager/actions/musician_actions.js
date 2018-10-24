import { MUSICIAN_DATA_SUCCESS } from '../action_types/musician_types';

export function musiciansDataSuccess(data) {
  return { type: MUSICIAN_DATA_SUCCESS, payload: data };
}
