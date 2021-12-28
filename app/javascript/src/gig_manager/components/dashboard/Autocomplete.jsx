import React, { useState } from "react"
import _ from "lodash"

function Autocomplete(props) {
  const [searchTerm, setSearchTerm] = useState("")
  const [searchResults, setSearchResults] = useState([])
  const [activeResult, setActiveResult] = useState("")

  function handleClickOrEnter() {
    props.setResultData(activeResult)
  }

  function handleSearchChange(e) {
    setSearchTerm(e.target.value)
    debouncedFetchData()
  }

  function fetchData() {
    const path = `${props.searchPath}?${new URLSearchParams({search: searchTerm})}`
    fetch(path, {
      method: "GET"
    }).then(res => {
      res.json().then(json => {
        console.log('setSearchResults - should update state')
        setSearchResults(json.musicians)
      })
    })
  }
  const debouncedFetchData = _.debounce(fetchData, 500)

  // TODO: functionality to allow for arrow key navigation of results and pressing enter to select result
  function handleArrowPress(keyCode) {

  }

  // props.handlePressEnterOnResult()

  return (
    <div className="autocomplete-container">
      <input
        type="text"
        value={searchTerm}
        onChange={handleSearchChange}
        className="form-control"
        placeholder={props.htmlPlaceholder || "Search"}
      />
      <div className="autocomplete-results">
        { 
          searchResults && searchResults.forEach(resultData => {
            return props.renderSearchResult(resultData)
          })
        }
      </div>
    </div>
  )
}

export default Autocomplete