import React from 'react'
import AvatarContainer from '../avatar/avatar_container'

const Dashboard = () => (
  <div className="ui container">
    <div className="ui two column grid">
      <div className="row">
        <div className="column">
          <AvatarContainer />
        </div>
        <div className="column"></div>
      </div>
    </div>
  </div>
)

export default Dashboard
