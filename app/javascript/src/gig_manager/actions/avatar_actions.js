const UPDATE_AVATAR_START = 'UPDATE_AVATAR_START'
// const UPDATE_AVATAR_SUCCESS = "UPDATE_AVATAR_SUCCESS"
// const UPDATE_AVATAR_FAIL = "UPDATE_AVATAR_FAIL"

export function updateAvatar(value) {
  return {
    type: UPDATE_AVATAR_START,
    avatar: value,
  }
}
