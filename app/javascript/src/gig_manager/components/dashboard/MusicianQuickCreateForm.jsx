import React, { useState } from "react"
import standardHeaders from "../shared/standardHeaders"

const MusicianQuickCreateForm = () => {
  const path = "/api/musicians"
  const initFields = {
    email: "",
    full_name: "",
    instrument: ""
  }
  const requiredFields = ["email", "full_name"]

  const [successMsg, setSuccessMsg] = useState("")
  const [serverError, setServerError] = useState("")
  const [submitting, setSubmitting] = useState(false)
  const [fields, setFields] = useState(initFields)
  const [errors, setErrors] = useState({})

  // TODO: validate email --> simplpe regex --> /\S+@\S+\.\S+/
  function validateForm() {
    let valid = true
    for (const field of requiredFields) {
      if (fields[field].length < 1) {
        setErrors(errors => ({...errors, [field]: "is required"}))
        valid = false
      }
    }
    return valid;
  }

  function handleChange(e) {
    setFields(fields => ({...fields, [e.target.name]: e.target.value}))
  }

  function resetErrors(){
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
          setSuccessMsg(`${data.full_name} has been added to your list of musicians`)
          resetErrors()
          setFields(initFields)
        })
      } else {
        res.json().then(json => setServerError(json.msg))
      }
      setSubmitting(false)
    })
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
            value={fields.email}
            className={errors.email ? errorClassName : stdClassName}
            name="email"
            type="email"
            placeholder="Email"
            aria-label="Email"
          />
          { errors.email && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-3">
          <input
            noValidate
            onChange={handleChange}
            value={fields.full_name}
            className={errors.full_name ? errorClassName : stdClassName}
            name="full_name"
            type="text"
            placeholder="Full Name"
            aria-label="Full Name"
          />
          { errors.full_name && <div className="invalid-feedback">Is Required</div>}
        </div>
        <div className="col-3">
          <input
            noValidate
            onChange={handleChange}
            value={fields.instrument}
            className={stdClassName}
            name="instrument"
            type="text"
            placeholder="Instrument"
            aria-label="Instrument"
          />
        </div>
        <div className="col-2 pt-1">
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

export default MusicianQuickCreateForm