import React from 'react'
import PropTypes from 'prop-types'
import { Card, Icon, Image } from 'semantic-ui-react'
import UpdateAvatarForm from './update_avatar_form'


// TODO: we can cache/load the avatar image in the props (since it will already be loaded)

class AvatarCard extends React.Component {
  static propTypes = {
    updateAvatar: PropTypes.func,
  }

  state = {
    isHovering: false,
  }

  showUpdateButton = () => this.setState({ isHovering: true })

  hideUpdateButton = () => this.setState({ isHovering: false })

  render() {
    const image = false ? <Image src="" /> : <Icon name="user" size="massive" />
    return (
      <Card>
        <div
          className="avatar-image-container"
          onMouseEnter={this.showUpdateButton}
          onMouseLeave={this.hideUpdateButton}
        >
          { image }
          <UpdateAvatarForm
            onUpdateAvatar={this.props.updateAvatar}
            className={this.state.isHovering ? '' : 'hidden'}
          />
        </div>
        <Card.Content>
          <Card.Header>Full Name</Card.Header>
          <Card.Description>
            You have X gigs this month!
          </Card.Description>
        </Card.Content>
      </Card>
    )
  }
}

export default AvatarCard
