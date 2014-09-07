models = require '../../models'
libs = require '../../lib'
#Child=mongoose.model('Child')
apiSchema = libs.ApiSchemaJson
Tutor = models.Tutor
Child = models.Child

exports.list = (req, res, next) ->

  Tutor.paginate({}, req.page, req.rows, (err, totalPages, users, usersSize)->

    return (req.mgsError= err; next()) if err?

    res.status 200
    res.json apiSchema.multiple(users, usersSize, totalPages, req.page)

  )

exports.retrieve = (req, res, next) ->
  Tutor
  .findOne({ _id: req.params.id})
  .populate('children')
  .exec( (err, user) ->

    return (req.mgsError= err; next()) if err?
    return (req.notFound = "Tutor"; next()) unless user

    res.status 200
    res.json apiSchema.one(user)

  )



exports.create = (req, res, next) ->

  tutor = new Tutor(req.body)
  tutor.password = req.body.password
  tutor.save((err)->
    return (req.mgsError= err; next()) if err?
    res.status 200
    res.json apiSchema.one(tutor)
  )


exports.update = (req, res, next) ->
  Tutor.updateOne({ _id: req.params.id}, req.body ,(err, tutor) ->

    return (req.mgsError= err; next()) if err?
    return (req.notFound = "Tutor"; next()) unless tutor

    res.status 200
    res.json apiSchema.one(tutor)
  )

exports.destroy = (req, res, next) ->
  Tutor.removeOne({_id: req.params.id}, (err, tutor)->
    return (req.mgsError= err; next()) if err?
    return (req.notFound = "Tutor"; next()) unless tutor

    res.status 200
    res.json apiSchema.one(Tutor)
  )

exports.addChild =(req, res, next) ->
  Tutor.findOne({_id: req.params.id}, (err, tutor)->
    return (req.mgsError= err; next()) if err?
    return (req.notFound = "Tutor"; next()) unless tutor

    child = new Child(req.body)
    child.vaccine()
    .then((n)->
      child.save((err)->
        return (req.mgsError= err; next()) if err?

        tutor.children.push(child._id)
        tutor.save((err)->
          return (req.mgsError= err; next()) if err?

          res.status 200
          res.json apiSchema.one(child)
        )
      )
    )
    .fail((err)->
      return (req.mgsError= err; next()) if err?
    )

  )


