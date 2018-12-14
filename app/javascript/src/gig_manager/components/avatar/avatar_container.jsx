import React from 'react';
import { connect } from 'react-redux';
import AvatarCard from './avatar_card';
import * as avatarActions from '../../actions/avatar_actions';

const mapStateToProps = state => (
  {
    imagePath: state.user.avatar_path,
  }
);

const mapDispatchToProps = dispatch => (
  {
    updateAvatar: value => dispatch(avatarActions.updateAvatar(value)),
  }
);

const AvatarContainer = connect(
  mapStateToProps,
  mapDispatchToProps,
)(AvatarCard);

export default AvatarContainer;
