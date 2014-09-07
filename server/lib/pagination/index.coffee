config = require '../../config'


middlewarePagination = (req,res, next)->
  req.page = config.pagination.page
  req.rows = config.pagination.rows
  if req.query.page?
    req.page = Number(req.query.page)
  if req.query.rows?
    req.rows = Number(req.query.rows)

  next()


module.exports = middlewarePagination