models = require '../../models'
libs = require '../../lib'


apiSchema = libs.ApiSchemaJson

Child = models.Child
Vaccine = models.Vaccine
Measure = models.Measure
Menu = models.Menu
Tutor = models.Tutor


exports.login = (req, res, next)->
  Tutor.findOne({email: req.params.email }, (err, tutor)->
    return (req.mgsError= err; next()) if err?
    return (req.notFound = "Tutor"; next()) unless tutor

    if tutor.login(req.pwd)
      res.status 200
      res.json tutor
    else
      res.satus 401
      res.json {msg: "Invalid credentials"}
  )

