import React from 'react'
import { Image } from 'semantic-ui-react'
import UpdateAvatarForm from './update_avatar_form'

class AvatarContainer extends React.Component {
  state = {
    isHovering: false,
  }

  showUpdateButton() {
    this.setState({ isHovering: true })
  }

  hideUpdateButton() {
    this.setState({ isHovering: false })
  }

  // TODO: onhover should expose file upload and button
  // then submit button
  render() {
    return (
      <div
        className="avatar-container"
        onMouseEnter={this.showUpdateButton}
        onMouseLeave={this.hideUpdateButton}
      >
        <Image src="" circular />
        <UpdateAvatarForm className={this.state.isHovering ? '' : 'hidden'} />
      </div>
    )
  }
}

// TODO: use connect()
export default AvatarContainer
