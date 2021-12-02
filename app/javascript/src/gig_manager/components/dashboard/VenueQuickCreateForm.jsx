import React, { useState } from "react"

const VenueQuickCreateForm = () => {
  const path = "/api/venues"

  const [successfulRequest, setSuccessfulRequest] = useState(false)
  const [errorRequest, setErrorRequest] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  function handleSubmit(e) {
    e.preventDefault()
    setSubmitting(true)

    fetch(path)
    .then((res) => {
      if (res.ok) setSuccessfulRequest()
      else setErrorRequest(true)
    })
  }

  return (
    <form className="mt-2" onSubmit={handleSubmit}>
      <div className="row">
        <div className="col-3">
          <input className="form-control" name="name" type="email" placeholder="Name" aria-label="Name" />
        </div>
        <div className="col-6">
          <input className="form-control" name="address1" type="text" placeholder="Address" aria-label="Address" />
        </div>
      </div>
      <div className="row">
        <div className="col-3">
          <input className="form-control" name="city" type="text" placeholder="City" aria-label="City" />
        </div>
        <div className="col-2">
          <input className="form-control" maxlength="2" name="state" type="text" placeholder="State" aria-label="State" />
        </div>
        <div className="col-3">
          <input className="form-control" name="zipcode" type="text" placeholder="Zipcode" aria-label="Zipcode" />
        </div>
        <div className="col-2 pt-1">
          <button type="submit" disabled={submitting} className="btn btn-sm btn-primary">Add Venue</button>
        </div>
      </div>
    </form>
  )
}

export default VenueQuickCreateForm