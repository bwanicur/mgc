import React, { useState } from "react"
import DatePicker from "react-date-picker"

import Autocomplete from './Autocomplete'

function GigCreateForm() {
  const path = "/api/gigs"
  const initFields = {
    title: "",
    date: null,
    start_time: null,
    end_time: null,
    musician_data: [],
    venue_id: null
  }
  const [fields, setFields] = useState(initFields)
  const [serverError, setServerError] = useState("")
  const [successMsg, setSuccessMsg] = useState("")
  const [submitting, setSubmitting] = useState(false)
  const [errors, setErrors] = useState({})

  function handleChange(e) {
    setFields(fields => ({...fields, [e.target.name]: e.target.value}))
  }

  function handleSubmit(e) {
    e.preventDefault()
    // TODO
  }

  function setMusicianData(data) {
    // TODO
  }

  function handleDatepickerChange(dateVal) {
    console.log('dateVal', dateVal)
    setFields(fields => ({ ...fields, date: dateVal }))
  }

  function renderMusicianSearchResult(data) {
    return (
      <div
        className="autocomplete-result row"
        onClick={() => setMusicianData(data)}
        key={data.id}
      >
        <div className="col-6">
          { data.name }
        </div>
        <div className="col-6">
          { data.instrument }
        </div>
      </div>
    )
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
          value={fields.title}
          className={errors.title ? errorClassName : stdClassName}
          name="title"
          type="text"
          placeholder="Title"
          aria-label="Title"
        />
        { errors.title && <div className="invalid-feedback">Is Required</div>}
      </div>
      <div className="col-2">
        <DatePicker
          onChange={handleDatepickerChange}
          value={fields.date}
          className={errors.date ? errorClassName : stdClassName}
          name="date"
          type="text"
          placeholder="Date"
          aria-label="Date"
        />
        { errors.date && <div className="invalid-feedback">Is Required</div>}
      </div>
      <div className="col-2">
        <input
          noValidate
          onChange={handleChange}
          value={fields.start_time}
          className={errors.start_time ? errorClassName : stdClassName}
          name="start_time"
          type="text"
          placeholder="Start Time"
          aria-label="Start Time"
        />
        { errors.title && <div className="invalid-feedback">Is Required</div>}
      </div>
      <div className="col-2">
        <input
          noValidate
          onChange={handleChange}
          value={fields.end_time}
          className={errors.end_time ? errorClassName : stdClassName}
          name="end_time"
          type="text"
          placeholder="End Time"
          aria-label="End Time"
        />
        { errors.end_time && <div className="invalid-feedback">Is Required</div>}
      </div>
    </div>
    <div className="row">
      <div className="col-3">
        Venue Autocomplete TBD
        { errors.venue_id && <div className="invalid-feedback">Is Required</div>}
      </div>
      <div className="col-6">
        <Autocomplete
          htmlPlaceholder="Search Musicians (name or instrument)"
          renderSearchResult={renderMusicianSearchResult}
          handlePressEnterOnResult={setMusicianData}
          searchPath="/api/musicians"
        />
        { errors.musicians_data && <div className="invalid-feedback">Is Required</div>}
      </div>
    </div>
    <div className="row">
      <div className="col-6">
        <textarea
          noValidate
          onChange={handleChange}
          value={fields.description}
          className={errors.description ? errorClassName : stdClassName}
          name="description"
          type="text"
          placeholder="Description"
          aria-label="Description"
        />
        { errors.title && <div className="invalid-feedback">Is Required</div>}
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

export default GigCreateForm