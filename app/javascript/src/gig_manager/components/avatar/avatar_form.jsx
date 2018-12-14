import React from 'react'
import PropTypes from 'prop-types'

const AvatarForm = ({ updateAvatar, isHovering }) => (
  <div className={`avatar-form-container ${isHovering ? '' : 'hidden'}`}>
    UPDATE IMAGE BUTTON
  </div>
  // TODO: form here - onsubmit --> updateAvatar
)

AvatarForm.propTypes = {
  updateAvatar: PropTypes.func,
  isHovering: PropTypes.bool,
}

export default AvatarForm;
