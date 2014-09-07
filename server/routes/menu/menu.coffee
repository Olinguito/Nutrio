models = require '../../models'
libs = require '../../lib'


apiSchema = libs.ApiSchemaJson

Child = models.Child
Vaccine = models.Vaccine
Measure = models.Measure
Menu = models.Menu


exports.list = (req, res, next) ->

  Menu.paginate({}, req.page, req.rows, (err, totalPages, users, usersSize)->

    return (req.mgsError= err; next()) if err?

    res.status 200
    res.json apiSchema.multiple(users, usersSize, totalPages, req.page)

  )

exports.retrieve = (req, res, next) ->

    Menu
    .findOne({ _id: req.params.id})
    .exec((err, menu) ->

        return (req.mgsError= err; next()) if err?
        return (req.notFound = "Menu"; next()) unless menu

        res.status 200
        res.json apiSchema.one(menu)
    )
