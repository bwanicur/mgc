import React from 'react'
import { Link } from 'react-router-dom'

const CollapseableNavigation = () => {
  const [isOpen, setIsOpen] = useState(false)
  
  const toggle = () => {
    setIsOpen(!isOpen)
  }

  const collapseableNav =
    <div className="collapse navbar-collapse">
      <ul className="navbar-nav me-auto mb-2 mb-lg-0">
        <li className="nav-item">
          <Link className="nav-link" to="/musicians">Musicians</Link> 
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/venues">Venues</Link> 
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/settings">Settings</Link> 
        </li>
      </ul>
    </div>

  return (
    <nav className="navbar navbar-light navbar-expand-lg bg-light">
      <div className="container-fluid">
        <Link to="/" className="navbar-brand">Gigs</Link>
        <button className="navbar-toggler" type="button" onClick={toggle} aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        {
          isOpen && collapseableNav
        }
      </div>
    </nav>
  )
}

export default CollapseableNavigation;
