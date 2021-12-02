import React, { useState } from "react"
import MusicianQuickCreateForm from "./MusicianQuickCreateForm"
import VenueQuickCreateForm from "./VenueQuickCreateForm"

// TODO
// - create musician form
// - create venue form
// - table-ish display of next 5 upcoming gigs

function Dashboard() {
  const [visibleMQC, setVisibleMQC] = useState(true)
  const [visibleVQC, setVisibleVQC] = useState(false)

  return (
    <div className="dashboard">
      <div className="row">
        <div className="gigs-container col-md-12">
          <div className="quick-add-forms">
            { visibleMQC && <MusicianQuickCreateForm /> }
            { visibleVQC && <VenueQuickCreateForm /> }
          </div>
          <div className="add-gig-form">
          </div>
        </div>
      </div>
    </div>
  )
}

export default Dashboard