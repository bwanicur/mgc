import React from 'react'
import AvatarContainer from '../avatar/avatar_container'

const Dashboard = () => (
  <div className="ui container">
    <div className="ui grid">
      <div className="five wide column">
        <AvatarContainer />
      </div>
      <div className="11 wide column"></div>
    </div>
  </div>
)

export default Dashboard
