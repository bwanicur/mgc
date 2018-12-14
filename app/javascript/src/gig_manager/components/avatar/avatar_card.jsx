import React from 'react'
import PropTypes from 'prop-types'
import { Card, CardTitle, CardText } from 'reactstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import AvatarForm from './avatar_form'

class AvatarCard extends React.Component {
  static propTypes = {
    updateAvatar: PropTypes.func,
    image: PropTypes.string,
  }

  state = {
    isHovering: false,
  }

  showUpdateButton = () => this.setState({ isHovering: true })

  hideUpdateButton = () => this.setState({ isHovering: false })

  render() {
    const image = this.props.image ? <CardImg src={ this.props.image } /> : <FontAwesomeIcon name="fas fa-user" />
    return (
      <Card>
        <div
          className="avatar-image-container"
          onMouseEnter={this.showUpdateButton}
          onMouseLeave={this.hideUpdateButton}
        >
          { image }
          <AvatarForm
            onUpdateAvatar={this.props.updateAvatar}
            isHovering={this.state.isHovering}
          />
        </div>
        <CardTitle>Full Name</CardTitle>
        <CardText>
            You have X gigs this month!
        </CardText>
      </Card>
    )
  }
}

export default AvatarCard
