const standardHeaders = function(requestMethod) {
  const headers = {
    "Content-Type": "application/json"
  }
  
  const desctructiveMethods = ["post", "patch", "put", "destroy"]
  if(desctructiveMethods.includes(requestMethod.toLowerCase())) {
    const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
    headers["X-CSRF-Token"] = csrfToken
  }

  return headers
}

export default standardHeaders