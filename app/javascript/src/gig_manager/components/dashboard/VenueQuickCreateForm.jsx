import React, { useState } from "react"
import standardHeaders from "../shared/standardHeaders"

const VenueQuickCreateForm = () => {
  const path = "/api/venues"
  const initFields = {
    name: "",
    address: "",
    city: "",
    state: "",
    zipcode: ""
  }
  const [successMsg, setSuccessMsg] = useState(null)
  const [serverError, setServerError] = useState("")
  const [submitting, setSubmitting] = useState(false)
  const [fields, setFields] = useState(initFields)
  const [errors, setErrors] = useState({})

  function handleChange(e) {
    setFields(fields => ({...fields, [e.target.name]: e.target.value}))
  }

  function validateForm() {
    let valid = true
    for (const [key, val] of Object.entries(fields)) {
      if (val.length < 1) {
        setErrors(errors => ({...errors, [key]: "is required"}))
        valid = false
      }
    }
    return valid;
  }

  function resetErrors() {
    setErrors({})
    setServerError("")
  }

  function handleSubmit(e) {
    e.preventDefault()
    setSubmitting(true)
    setSuccessMsg("")
    resetErrors()
    if(!validateForm()) {
      setSubmitting(false)
      return
    }

    fetch(path, {
      method: "post",
      headers: standardHeaders("post"),
      body: JSON.stringify(fields)
    })
    .then((res) => {
      if (res.ok) {
        res.json().then(data => {
          // TODO: replace with timed message
          setSuccessMsg(`${data.name} has been added to your list of venues`)
          resetErrors()
          setFields(initFields)
        })
      } else {
        res.json().then(json => setServerError(json.msg))
      }
      setSubmitting(false)
    })
  }

  function clearForm() {
    
  }

  const stdClassName = "form-control"
  const errorClassName = "form-control is-invalid"

  return (
    <form className="mt-2" onSubmit={handleSubmit}>
      { successMsg && <div className="alert alert-success">{successMsg}</div> }
      { serverError && <div className="alert alert-danger">{serverError}</div> }
      <div className="row">
        <div className="col-3">
          <input
            noValidate
            onChange={handleChange}
            value={fields.name}
            className={errors.name ? errorClassName : stdClassName}
            name="name"
            type="text"
            placeholder="Name"
            aria-label="Name"
          />
          { errors.name && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-6">
          <input
            noValidate
            onChange={handleChange}
            value={fields.address}
            className={errors.address ? errorClassName : stdClassName}
            name="address"
            type="text"
            placeholder="Address"
            aria-label="Address"
          />
          { errors.address && <div className="invalid-feedback">Is Required</div>}
        </div>
      </div>
      <div className="row">
        <div className="col-3">
          <input
            noValidate
            onChange={handleChange}
            value={fields.city}
            className={errors.city ? errorClassName : stdClassName}
            name="city"
            type="text"
            placeholder="City"
            aria-label="City"
          />
          { errors.city && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-2">
          <input
            noValidate
            onChange={handleChange}
            value={fields.state}
            className={errors.state ? errorClassName : stdClassName}
            maxLength="2"
            name="state"
            type="text"
            placeholder="State"
            aria-label="State"
          />
          { errors.state && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-2">
          <input
            noValidate
            onChange={handleChange}
            value={fields.zipcode}
            className={errors.zipcode ? errorClassName : stdClassName}
            name="zipcode"
            type="text"
            placeholder="Zipcode"
            aria-label="Zipcode"
          />
          { errors.zipcode && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-2 pt-1 text-end">
          <button
            type="submit"
            disabled={submitting}
            className="btn btn-sm btn-primary"
          >Create</button>
        </div>
      </div>
    </form>
  )
}

export default VenueQuickCreateForm