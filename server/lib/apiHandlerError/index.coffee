Status =
  status405: (req, res, next)->
    return next() if req.mgsError? || req.notFound?

    res.status 405
    res.json {msg: "Method Not Allowed"}

  status404: (req, res, next)->

    return next() if req.mgsError?

    message = if req.notFound? then " "+req.notFound else " EndPoint '" + req.path+ "' "
    res.status 404
    res.json {msg: "Not found" + message}



module.exports = Status