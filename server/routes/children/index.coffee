router = require('express').Router()
child = require './child'

router.route('/:id')
    .get(child.retrieve)
    .put(child.update)
    .delete(child.destroy)
    .post(child.addMeasure)#Agrega una medida al historial

router.route('/:id/vaccinate')
    .put(child.vaccinate)

router.route('/')
    .get(child.list)
    .post(child.create)

module.exports = router
