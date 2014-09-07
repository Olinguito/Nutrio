router = require('express').Router()
childrenR = require '../children'
tutor = require './tutor'

router.param('id', (req, res, next, id) ->
  req.params.id = id
  next();
)

router.use('/:id/children',childrenR)

router.route('/:id')
    .get(tutor.retrieve)
    .put(tutor.update)
    .post(tutor.addChild)#Agrega el niño al cuidado

router.route('/')
    .get(tutor.list)
    .post(
      (req, res) ->
        res.header 'Access-Control-Allow-Origin', '*'
        tutor.create(req,res))

module.exports = router
