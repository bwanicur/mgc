import React from 'react'
import { connect } from 'react-redux'
import AvatarCard from './avatar_card'
import * as avatarActions from '../../actions/avatar_actions'

const mapDispatchToProps = dispatch => (
  {
    updateAvatar: value => dispatch(avatarActions.updateAvatar(value)),
  }
)

const AvatarContainer = connect(
  null,
  mapDispatchToProps,
)(AvatarCard)

export default AvatarContainer
