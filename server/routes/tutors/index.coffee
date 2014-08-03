router = require('express').Router()
tutor = require './tutor'

router.route('/:id')
    .get(tutor.retrieve)
    .put(tutor.update)
    .delete(tutor.destroy)
    .post(tutor.addChild)#Agrega el niño al cuidado

router.route('/')
    .get(tutor.list)
    .post(
      (req, res) ->
        res.header 'Access-Control-Allow-Origin', '*'
        tutor.create(req,res))

module.exports = router
